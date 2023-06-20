# Deploy NextJS with Docker and Github Actions

Deploy NextJs app with Docker and Nginx using github actions.

## Context

- We will use github actions and CI/CD.
- We will configure server to a way so that we can deploy stage and production app on the same server.
- In this example Runner Host and Deployment server will be same.

## Configure Github Action with server

- [Configure github actions](https://github.com/nayan32biswas/nayan32biswas/blob/main/src/posts/github-action.md) with your server.
- Create a folder(`/www/<project>/`) in the server where we will store the file related the project like `docker-compose`, `.env` etc.
- Add `.env.stage` and `.env.prod` in `/www/<project>/` for environment variable.

## Dockerize the project

- Add `Dockerfile`

```dockerfile
FROM node:18-alpine

ENV NODE_ENV production

WORKDIR /app
COPY package.json yarn.* ./
RUN yarn install

COPY . .
RUN yarn build

CMD ["yarn", "start"]
```

- Add `docker-compose-stage.yml` for **Stage**

```yml
version: "3.8"

services:
  frontend:
    container_name: frontend_stage
    image: nayanbiswas/frontend:stage
    command: ["yarn", "start"]
    ports:
      - 3001:3000
    expose:
      - 3001
```
- Add `docker-compose-prod.yml` for **Production**

```yml
version: "3.8"

services:
  frontend:
    container_name: frontend_prod
    image: nayanbiswas/frontend:prod
    command: ["yarn", "start"]
    ports:
      - 3000:3000
    expose:
      - 3000
```

## Write Github Workflows

### Workflows for Stage

Create workflows file `.github/workflows/stage.yml`.

```yml
name: Build and Deploy For Stage

on:
  push:
    branches:
      - stage

jobs:
  build:
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v3

      - name: Setup env
        run: cp -rv /www/<project>/.env.stage ./.env
      - name: Build Docker image
        run: |
          docker build -t nayanbiswas/project:stage --file Dockerfile .

  deploy:
    needs: build
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v3

      - name: Deploy to Stage
        run: |
          # Add your deployment steps here
          cp -rv ./docker-compose-stage.yml /www/<project>/
          cd /www/<project>/
          docker-compose -f docker-compose-stage.yml stop frontend
          docker-compose -f docker-compose-stage.yml up -d frontend
          docker image prune -f # Clean Space
```

### Workflows for Prod

Create workflows file `.github/workflows/prod.yml`.

```yml
name: Build and Deploy For Prod

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v3

      - name: Setup env
        run: cp -rv /www/<project>/.env.prod ./.env
      - name: Build Docker image
        run: |
          docker build -t nayanbiswas/project:prod --file Dockerfile .

  deploy:
    needs: build
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v3

      - name: Deploy to Prod
        run: |
          # Add your deployment steps here
          cp -rv ./docker-compose-prod.yml /www/<project>/
          cd /www/<project>/
          docker-compose -f docker-compose-prod.yml stop frontend
          docker-compose -f docker-compose-prod.yml up -d frontend
          docker image prune -f # Clean Space
```

## Install and configure Nginx

- `sudo apt update; sudo apt install nginx`
- `sudo ufw allow 'Nginx Full'`

### Configure Nginx for Stage

- `sudo vi  /etc/nginx/conf.d/frontend-stage.conf` Open new nginx config file. And past bellow config code in that file.

```conf
upstream frontend_server_stage {
    server localhost:3001;
}
server {
  listen          80;
  server_name     stage.example.com;
  server_tokens   off;

  location / {
      proxy_pass                  http://frontend_server_stage;
      proxy_pass_request_headers  on;
      proxy_set_header            X-Forwarded-For         $proxy_add_x_forwarded_for;
      proxy_set_header            Host                    $http_host;
      proxy_set_header            X-Forwarded-Proto       $scheme;
      proxy_redirect              off;
  }
}
```

- `sudo nginx -t` check status.
- `sudo systemctl restart nginx` Reload nginx file.

### Configure Nginx for Prod

- `sudo vi  /etc/nginx/conf.d/frontend-prod.conf` Open new nginx config file. And past bellow config code in that file.

```conf
upstream frontend_server_prod {
    server localhost:3000;
}
server {
  listen          80;
  server_name     example.com;
  server_tokens   off;

  location / {
      proxy_pass                  http://frontend_server_prod;
      proxy_pass_request_headers  on;
      proxy_set_header            X-Forwarded-For         $proxy_add_x_forwarded_for;
      proxy_set_header            Host                    $http_host;
      proxy_set_header            X-Forwarded-Proto       $scheme;
      proxy_redirect              off;
  }
}
```

- `sudo nginx -t` check status.
- `sudo systemctl restart nginx` Reload nginx file.

