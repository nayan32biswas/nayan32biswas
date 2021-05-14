# Setup nginx

**Install**.
- `sudo apt update; sudo apt install nginx`

- `sudo unlink /etc/nginx/sites-enabled/default` first time in a server.
- `sudo vi /etc/nginx/conf.d/<project>.conf`
- **Add file**
- `sudo nginx -t` check status.
- `sudo systemctl restart nginx` Reload nginx file.

```conf
log_format upstreamlog '$server_name: [$status] [$time_local] [rt=$request_time] [bbs=$body_bytes_sent] [uct="$upstream_connect_time"] [urt="$upstream_response_time"] [ru=$remote_user] ["$request"]';

; ; sock file version
; upstream backend_server {
;     server unix:/www/<project_name>/app/staticfiles/<project_name>.sock fail_timeout=0;
; }

; ip version
upstream backend_server {
    ; ip_hash; If multiple instance running, this will send single user to a single targeted server over and over.

    ; server localhost:8001; if have multiple server or instance
    ; server localhost:8002; if have multiple server or instance
    server localhost:8000;
}
server {
    listen          80 default_server;
    server_name     localhost 127.0.0.1;
    access_log      /var/log/nginx/<project_name>.access.log upstreamlog;
    error_log       /var/log/nginx/<project_name>.error.log warn;
    server_tokens   off;

    location /static/ {
        autoindex   off;
        alias       /www/<project_name>/app/staticfiles/static/;
    }
    location /media/ {
        autoindex off;
        alias       /www/<project_name>/app/staticfiles/media/;
    }

    location / {
        proxy_pass                  http://backend_server;
        proxy_pass_request_headers  on;
        proxy_set_header            X-Forwarded-For         $proxy_add_x_forwarded_for;
        proxy_set_header            Host                    $http_host;
        proxy_set_header            X-Forwarded-Proto       $scheme;
        proxy_redirect              off;
    }
}
```


# Problem solution

## Problem 1

**413 Request Entity Too Large - File Upload Issue**.

**Solution**:

`sudo vi /etc/nginx/nginx.conf`

```nginx
http {
    client_max_body_size 100M;
}
```

`sudo systemctl restart nginx`

## Problem 2

**Skipping adding rules**.

**Solution**:

```bash
sudo ufw disable
sudo ufw reset
sudo ufw enable
```

## Problem 3

**DevTools failed to parse SourceMap**.
actually problem on **nginx**.

**Solution**.


## Example

```conf
server {
    server_name admin.project.com;

    location = /favicon.ico { access_log off; log_not_found off; }

    location /dashboard {
        root /www/project;
        index index.html;
        try_files $uri $uri/ /dashboard/index.html;
    }

    location / {
        include proxy_params;
        proxy_pass http://unix:/www/project/socket/project-api.sock;
    }

    location /static/ {
        root /www/project/saleor;
    }

    location /media/ {
        root /www/project/saleor;
    }

    client_max_body_size 50M;

}
map $sent_http_content_type $expires {
    "text/html"                 epoch;
    "text/html; charset=utf-8"  epoch;
    default                     off;
}

server {             # the port nginx is listening on
    server_name     project.com;    # setup your domain here

    gzip            on;
    gzip_types      text/plain application/xml text/css application/javascript;
    gzip_min_length 1000;

    location / {
        expires $expires;

        proxy_redirect                      off;
        proxy_set_header Host               $host;
        proxy_set_header X-Real-IP          $remote_addr;
        proxy_set_header X-Forwarded-For    $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto  $scheme;
        proxy_read_timeout          1m;
        proxy_connect_timeout       1m;
        proxy_pass                          http://unix:/www/project/socket/project-frontend.sock;
    }

    location /_nuxt/ {
        root /www/project/fortend;
    }
}

```