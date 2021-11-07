# [Create a Linux VM on Google Cloud Platform (GCP)](https://console.cloud.google.com/compute/instances)

## Creating Instance
1. Compute Engine -> VM instances (It will tace some sec or minute)
2. Create
   1. Select Region - Select Zone(Optional)
   2. Boot disk -> Change -> Ubuntu(Assign memory if nedded)
   3. (Optional) Management
      1. Preemptibility(It will remain 24 hour one after start) very low cost.
   4. Save or Create

## SSH to Instance
1. Compute Engine -> VM instances
2. Settings -> Metadata
   1. SSH Keys
      1. Add or Edit
      2. Copy You pubkey `cat ~/.ssh/id_rsa.pub`
      3. Save
3. ssh nayan32biswas@<extarnal_id>

## Connect Domain
1. VPC Network -> Extarnal IP Addresses
   1. Type make **static**
2. Newtwork Services -> Cloud DNS
   1. Enable
   2. Create Zone
      1. public
      2. Name -> any name
      3. DNS name -> **yourdomain.com**
      4. Descirption -> any
      5. Create
      6. ADD RECORD SET
         1. DNS name `.yourdomain.com`
         2. ExtarnalIP
      7. ADD RECORD SET
         1. DNS name `www.yourdomain.com`
         2. ExtarnalIP
      8. Setup **NAMESERVERS** on your domain provider
         1. ns-cloud-nn.googledomains.com
         2. ns-cloud-nn.googledomains.com
         3. ns-cloud-nn.googledomains.com
         4. ns-cloud-nn.googledomains.com


# [Django on Google Cloud](https://cloud.google.com/python/django/appengine/)

1. [Create Project](https://console.cloud.google.com/projectselector2/home/dashboard)
2. [Enable API](https://console.cloud.google.com/flows/enableapi)
3. [Install and initialize the Cloud SDK](https://cloud.google.com/sdk/docs)
   1. `echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list`
   2. `sudo apt-get install apt-transport-https ca-certificates gnupg`
   3. `curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -`
   4. `sudo apt-get update && sudo apt-get install google-cloud-sdk`
   5. `sudo apt-get install google-cloud-sdk-app-engine-python`
   6. `gcloud init`
      1. Login with mail and select your created project.
4. `gcloud auth application-default login`
5. `git clone https://github.com/GoogleCloudPlatform/python-docs-samples.git && cd python-docs-samples/appengine/standard_python37/django`
6. `gcloud services enable sqladmin` **Inside project files**
7. Installing the Cloud SQL Proxy
   1. `wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy` **Inside project files**
   2. `chmod +x cloud_sql_proxy`
8. [Creating a Cloud SQL instance](https://cloud.google.com/sql/docs/mysql/create-instance)
   1. [Go to the Cloud SQL Instances page](https://console.cloud.google.com/sql/instances)
      1. Create Instance
      2. Select Database
      3. Fillup all fields
      4. Create user from database instance.
      5. Create data base database instance.
   2. `gcloud sql instances describe [YOUR_INSTANCE_NAME]` copy **connectionName** from information
9. Initializing your Cloud SQL instance
   1.  For Mysql
       - `./cloud_sql_proxy -instances="[YOUR_INSTANCE_CONNECTION_NAME]"=tcp:3306`
       - If you get this message **listen tcp 127.0.0.1:3306: bind: address already in use** Then stop mysql by
       - `sudo netstat -nlpt |grep 3306`
       - `sudo service mysql stop`
     
   2. For PG
      - `./cloud_sql_proxy -instances="[YOUR_INSTANCE_CONNECTION_NAME]"=tcp:5432`
       - If you get this message **listen tcp 127.0.0.1:5432: bind: address already in use** Then stop mysql by
       - `sudo lsof -i :5432`
       - `sudo kill <pid>`
   3.  **Take it as running** This will effect on remote server.
       
10. Running the app on your local computer
11. Project setup.
    1.  On `project/main.py`
         ```py
         from mysite.wsgi import application as app
         ```
   4. On `project/app.yaml`
         ```yaml
         runtime: python37
         handlers:
         - url: /static
           static_dir: static/
         - url: /.*
           script: auto
         env_variables:
            DJANGO_SETTINGS_MODULE: mysite.settings.prod
         ```
   5. For Database On production
      ```py
      DATABASES = {
         'default': {
            'ENGINE': 'django.db.backends.postgresql',
            'HOST': '/cloudsql/[YOUR_INSTANCE_CONNECTION_NAME]',
            'NAME': '[DATABASE_NAME]',
            'USER': '[DATABASE_USER]',
            'PASSWORD': '[DATABASE_PASSWORD]'
         }
      }
      ```
12. Deploying the app to the App Engine standard environment
    1.  `python manage.py collectstatic`
    2.  `gcloud app deploy` This also used for update or upgrade project. After upgrading make sure you remove previous version.
        1.  `6` set server location
        2.  `y` to continue.
    3. `gcloud app browse` To open your app on browser.
