# [Digitalocean Django with Postgres](https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-16-04)

```bash
ssh root@__ip_address__ # if first time in droplet then check your email and copy password then past it. then set new password.
adduser pc_username
usermod -aG sudo pc_username
```

## Installation

Install **python postgresql**.

```bash
sudo apt-get update
sudo apt-get install python3-pip python3-dev libpq-dev postgresql postgresql-contrib nginx
```

**Setup Postgresql**.

```bash
sudo -u postgres psql
```

Then

```sql
CREATE DATABASE db_name;
CREATE USER dbusername WITH PASSWORD 'PASSWORD';
ALTER ROLE dbusername SET client_encoding TO 'utf8';
ALTER ROLE dbusername SET default_transaction_isolation TO 'read committed';
ALTER ROLE dbusername SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE db_name TO dbusername;
\q
```

Install **pip & virtualenv**.

```bash
sudo -H pip3 install --upgrade pip
sudo -H pip3 install virtualenv
```

Create **project folder**.

```bash
mkdir <project_name>
cd <project_name>/
```

Create **virtualenv and active** it.

```bash
mkdir envs
cd envs/
virtualenv project_name
source <...env_path...>/<project_name>/bin/activate
pip install -r requirements.txt
```

## [Connect Domain with hosting](https://www.youtube.com/watch?v=QduZyoy_eFA&t=326s)

In **[Digitalocean](https://cloud.digitalocean.com/projects/)**

Droplets --> networking:
    Add a domain field and press Add Domain
    then first start <<@>>, then <<www.>> and create

In **[Namecheap](https://ap.www.namecheap.com/domains/list/)**

account --> Domain List --> Manage:
    NAMESERVERSALERT --> Custom DNS:
        ns1.digitalocean.com
        ns2.digitalocean.com
        ns3.digitalocean.com
        then save.

## Project setup

```py
ALLOWED_HOSTS = ['your_server_domain_or_IP', 'second_domain_or_IP', . . .]
```

Necessary **Django** command.

```bash
python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser
```

**Active port 8000** with ufw

```bash
sudo ufw allow 8000
```

**Run server** normaly.

```bash
python manage.py runserver 0.0.0.0:8000 # open in browser http://<server_domain_or_IP>:8000
```

## Set up Redis

redis-server
redis-cli ping

## Setup celery with if running

**Activate** virtual environment and go to root file of the project.

```bash
echo_supervisord_conf > supervisord.conf
vi supervisord.conf
```

```file
[program:celeryd]
command=/home/<...path...>/<project_name>/bin/celery -A <project_name> worker -l info
stdout_logfile=/home/<...path...>/<project_name>/celeryd.log
stderr_logfile=/home/<...path...>/<project_name>/celeryd.log
autostart=true
autorestart=true
startsecs=10
stopwaitsecs=600
```

```bash
supervisord
supervisorctl restart celeryd
```

If get **Error** from first command from upper two command then stop process and retry all command.

- `ps -ef | grep supervisord` to find running process.

Find id **<pc_user>+  <8573>  2592  0 23:56 ?        00:00:00 /usr/bin/python /usr/bin/supervisord**

- `kill -s SIGTERM 8573` Run this command to stop previous supervisord

**Run server** with **gunicorn**

```bash
gunicorn --bind 0.0.0.0:8000 <project_name>.wsgi
```

## Setup gunicorn

**environment** variable. Open new file and assign variable data.

```file
PASSWORD="PASSWORD"
DEBUG="True"
BASE_URL="ipaddress"
```

Set **static files with gunicorn**

Firstly deactivate virtualenv

Create environment file for gunicorn and set data to this file.

```bash
DEBUG="FALSE"
PASSWORD="PASSWORD"
```

Open **gunicorn.service** file.

```bash
sudo vi /etc/systemd/system/gunicorn.service
```

**Change into necessary** line and past to **gunicorn.service** file.

```server
[Unit]
Description=gunicorn daemon
After=network.target

[Service]
User=<pc_username>
Group=www-data
WorkingDirectory=/home/<...path...>/<project_name>
ExecStart=/home/<...env_path...>/bin/gunicorn --access-logfile - --workers 3 --bind unix:/home/<pc_username>/<project_name>.sock <project_name>.wsgi:application
EnvironmentFile=/home/<user>/<.filename>

[Install]
WantedBy=multi-user.target
```

Run this command for **gunicorn**.

```bash
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
sudo systemctl status gunicorn
sudo journalctl -u gunicorn
```

## Setup nginx server

- `sudo apt update && sudo apt install nginx` **Install if not exist**
- `sudo vi /etc/nginx/sites-available/<project_name>` Open new file **as project name**.

```file
server {
    listen 80;
    server_name server_IP www.example.com example.com;

    location = /favicon.ico { access_log off; log_not_found off; }
    location /static/ {
        root /home/<...path...>/<project_name>;
    }
    location /media/ {
        root /home/<...path...>/<project_name>;
    }

    location / {
        include proxy_params;
        proxy_pass http://unix:/home/<pc_username>/<project_name>.sock;
    }
}
```

`sudo ln -s /etc/nginx/sites-available/<project_name> /etc/nginx/sites-enabled` Handle **nginx** file.

Start **nginx**

```bash
sudo nginx -t
sudo systemctl restart nginx
sudo ufw delete allow 8000
sudo ufw allow 'Nginx Full'
```

## After changing something

For each change **Restart Gunicorn & Nginx**.

```bash
sudo systemctl restart gunicorn; sudo systemctl restart nginx
```

For **celery**.

If you change on the **supervisord.conf** then follow all process.

**Activate** virtual environment and run.

`supervisorctl restart celeryd`

If you change **gunicorn systemd service file**

```bash
sudo systemctl daemon-reload; sudo systemctl restart gunicorn
```

If you change the **Nginx server** block configuration

```bash
sudo nginx -t && sudo systemctl restart nginx
```

- Check the Nginx process logs by typing: `sudo journalctl -u nginx`
- Check the Nginx access logs by typing: `sudo less /var/log/nginx/access.log`
- Check the Nginx error logs by typing: `sudo less /var/log/nginx/error.log`
- Check the Gunicorn application logs by typing: `sudo journalctl -u gunicorn`
