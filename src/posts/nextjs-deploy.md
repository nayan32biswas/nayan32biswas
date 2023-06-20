# Deploy NextJS with pm2

Deploy NextJs app with pm2 and nginx.

## Context

We will deploy NextJs app with pm2 and nginx.
Instead of managed service we will use bear metal server to deploy our project.


## Install and configure pm2

- `sudo npm i -g pm2` Install pm2 globally

### Configure pm2

Navigate to the project. Create file with name **ecosystem.config.js**

```js
module.exports = {
  apps: [
    {
      name: "app-name",
      script: "npm",
      args: "start",
      env: {
        PORT: 3000,
      },
    },
  ],
};
```
We configure pm2 with ecosystem for better control.

## Start app server with pm2

- Clone the project to the server. And navigate to the project directory.
- `yarn install && yarn build` Install package and build the project to production use.
- `pm2 start ecosystem.config.js --only app-name` First time for a project run this command.

## Update project

Follow the rules to update new code.

- Redirect to server project and pull lates code.
- `yarn build` Build the project with latest code.
- `pm2 reload app-name` for each update run this 

## Install and configure Nginx

- `sudo apt update; sudo apt install nginx`
- `sudo ufw allow 'Nginx Full'`
- `sudo vi  /etc/nginx/conf.d/frontend-stage.conf` Open new nginx config file. And past bellow config code in that file.

```conf
upstream frontend_server_stage {
    server localhost:3000;
}
server {
  listen          80;
  server_name     <ip-address or domain>;
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