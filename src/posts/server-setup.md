# Server initial setup

- `sudo apt update && apt upgrade` Update and upgrade all packages.

### Add ssh key in local

- `sudo chmod 600 ~/.ssh/<file-name>.pem`
- `ssh-keygen -y -f <file-name>.pem > <file-name>.pub`
- `vi config`
    ```conf
    Host <server-name>
        HostName <ip-address>
        User <ubuntu>
        Port <22>
        IdentityFile ~/.ssh/<file-name>.pem
    ```
- `ssh <server-name>`

### Setup ssh & github
- `cd ~/.ssh/`
- `ssh-keygen -t rsa -b 4096 -C "<email>"`
- `sudo touch config && chmod 600 config`
- `vi config`
  ```conf
  Host github.com
    Hostname github.com
    IdentityFile ~/.ssh/github
  ```

### Setup nginx & docker

### Setup project

- `sudo mkdir /www/ && cd /www/ && chown $USER:$USER .;` Create base file and update owner permission.
- Create .env file and customise other files.
- `cd /www/ && git clone <url> && cd <project>/` Clone git project and navigate to the project.
- `docker-compose -f docker-compose-dev.yml up -d api;` Make the project up and running.


### Setup deployment command

```sh
#!/bin/sh

cd /www/<project-path>/

git pull origin main;

docker-compose -f docker-compose-dev.yml build api;
docker-compose -f docker-compose-dev.yml stop api;
docker-compose -f docker-compose-dev.yml up -d api;
```


- `alias deploy="~/deploy.sh"` inside **.bashrc** file and alias.
- `sudo chmod +x ~/deploy.sh` update sh file permission.


- `deploy` to Update project.

