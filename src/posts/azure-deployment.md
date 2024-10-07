# Infrastructure Deployment In Azure

## Azure Static Web Apps

- Create App
- Select github as source of the code. Add repository permission and select the repository and targeted branch.
- Add **staticwebapp.config.json** file. Otherwise the routing will not work.

```json
// staticwebapp.config.json
{
    "navigationFallback": {
        "rewrite": "index.html",
        "exclude": ["/images/*.{png,jpg,gif,ico}", "/*.{css,scss,js}"]
    }
}
```

- Add Environment variable in the github repository. **Settings > Secrets and Variables > Actions**.
- Update the build pipeline with the following code

```yml
# .github/workflows/azure-static-web-apps- ** .yml
        # ...
        with:
          # ...
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          action: "upload"
          app_location: "/"
          api_location: ""
          output_location: "build"
          # Add new new line
          app_build_command: "npm run build"
        env:
          # Add your secret keys
          REACT_APP_BASE_API_URL: ${{ secrets.REACT_APP_BASE_API_URL }}
          ...
```

### Add custom domain ([Azure Doc](https://learn.microsoft.com/en-us/azure/static-web-apps/custom-domain))

- Navigate to the static web app in the Azure portal.
- Select **Custom domains** from the left-hand menu.
- Click **Add custom domain**.
- Enter the domain name you want to add(e.g. `abc.example.com`), and click **Add**.
- Add CNAME record to the DNS server.
- Once the DNS record is created, click **Verify**.
- Click **Create** to add the custom domain to your static web app.
- Once the custom domain is added, you can access your static web app using the custom domain name.

## Azure Virtual Machine

- Connect to the virtual machine using the SSH command.
  - `sudo chmod 600 ~/.ssh/<file-name>.pem`
  - `ssh -i ~/.ssh/<pem-file-name>.pem <username>@<ip-address>`

### Setup ssh key in local machine

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

- Connect to the virtual machine using the SSH command.
  - `ssh <server-name>`

## Configure Virtual Machine

### Add swap memory

- `sudo swapoff -a; sudo fallocate -l 3G /swapfile; sudo chmod 600 /swapfile; sudo mkswap /swapfile; sudo swapon /swapfile`

### Install Docker

- Set up Docker's apt repository.

```sh
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

- Install the Docker packages.

```sh
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

- Verify that the Docker Engine is installed correctly by running the hello-world image.

```sh
sudo docker run hello-world
```

NOTE: To avoid using sudo for docker activities, add your username to the Docker Group

```sh
sudo usermod -aG docker $USER
newgrp docker
```

Validate the Nginx installation by opening the IP address of the virtual machine in a web browser.

### Connect with github repository

- `ssh-keygen -t rsa -b 4096 -C "example@example.com" -f ~/.ssh/<your-filename>`
- `vi ~/.ssh/config`

```conf
Host <host-name>
    HostName github.com
    User git
    IdentityFile ~/.ssh/<your-filename>
```

- `cat ~/.ssh/<your-filename>.pub`
- Add the public key to the github repository. **Repository > Deploy keys > Add deploy key**.

- `mkdir <project-dir> && cd <project-dir>` Create and navigate to the project directory.
- `sudo chown $USER:$USER .` Update the owner permission.
- `git clone git@<host-name>:<your-repo-username>/<repo-name>.git` Clone the repository.

### Configure Nginx

- `sudo apt update && sudo apt install nginx`
- `sudo unlink /etc/nginx/sites-enabled/default`
- `sudo vi /etc/nginx/conf.d/appname.conf`

```conf
log_format upstream_log '$server_name: [$status] [$time_local] [rt=$request_time] [bbs=$body_bytes_sent] [uct="$upstream_connect_time"] [urt="$upstream_response_time"] [ru=$remote_user] ["$request"]';

access_log /var/log/nginx/appname_backend.access.log upstream_log;
error_log /var/log/nginx/appname_backend.error.log warn;

upstream backend_server {
    server localhost:8000;
}

server {
    listen          80 default_server;
    server_name     api.appname.com;

    location / {
      proxy_pass                  http://backend_server;
      proxy_pass_request_headers  on;
      proxy_set_header            X-Forwarded-For         $proxy_add_x_forwarded_for;
      proxy_set_header            Host                    $http_host;
      proxy_set_header            X-Forwarded-Proto       $scheme;
      proxy_redirect              off;
      proxy_buffering             off;
      proxy_cache_bypass          $http_upgrade;

      # WebSocket support
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection "upgrade";
    }
}
```

- `sudo nginx -t` check configuration.
- `sudo systemctl restart nginx` Reload nginx file.
- `sudo systemctl status nginx` Check status.

## LetsEncrypt certbot

```bash
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository universe
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot python3-certbot-nginx
```

- `sudo certbot --nginx` Apply encryption

### Database Backup and restore

```sh
docker exec -t <container-name> pg_dumpall -c -U root | gzip > dump_`date +%Y-%m-%d"_"%H_%M_%S`.sql.gz
gunzip -c <dump_file.sql.gz> | docker exec -i <container-name> psql -U root -d postgres
```

### Task Backup of a Docker volume

- `docker cp <container_name>:/<path-of-the-folder>/ ./<backup_file_name>`
- `tar -czvf <backup_file_name>.tar.gz ./<backup_file_name>`
- `scp -i <pem_file> <USER>@<IP_ADDRESS>:~/<backup_file_name>.tar.gz ./` **Move zip file from server to server**
- `tar -xzvf <backup_file_name>.tar.gz`
- `docker cp ./<backup_file_name>/ <container_name>:/chroma/`
- `docker exec -it <container_name> bash`
- Adjust your backup file/folder base on your use case inside the container.


### Azure Blob Storage

- Create Azure Storage Account.
  - Select **Azure Blob Storage or Azure Data Lake Storage Gen 2**.
  - Continue with others (Read the info before selecting or unselecting the options).
- Create Container.
  - A container is a logical grouping of blobs. Like a folder.
  - Azure requires a container to upload a file.

#### Get the Blob Storage Connection String from Azure

- **Storage Account > Security + Networking > Access keys.**
- The connection string contains the information to connect to the storage account.

#### Make a container publicly accessible

- Open the container.
- Select **Chages access level** from the top.
- Select **Public access level** as **Blob**.
- Click **OK**.

#### Upload file to Azure Blob Storage

```py
from azure.core.exceptions import AzureError
from azure.storage.blob import BlobServiceClient

blob_service_client = BlobServiceClient.from_connection_string(AZURE_BLOB_STORAGE_CONNECTION_STRING)
container_client = blob_service_client.get_container_client(container)

blob_client = container_client.get_blob_client(file_path)
blob_client.upload_blob(uploaded_file.file, overwrite=True)
```

#### Download file from Azure Blob Storage

```py
from azure.core.exceptions import AzureError
from azure.storage.blob import BlobServiceClient

blob_service_client = BlobServiceClient.from_connection_string(AZURE_BLOB_STORAGE_CONNECTION_STRING)
container_client = blob_service_client.get_container_client(container)
blob_client = container_client.get_blob_client(azure_path)

response = blob_client.download_blob()
file_content = response.readall()
```
