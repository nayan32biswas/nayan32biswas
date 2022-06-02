# AWS

## [Aws CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

- `curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"`
- `unzip awscliv2.zip`
- `sudo ./aws/install`
- `aws configure`
  - Access Key ID
  - Secret Access Key
  - Region
  - Blank
- `aws ec2 describe-instances` To chec connection.


## AWS Elastic Beanstalk

### [Create Project](https://us-east-2.console.aws.amazon.com/elasticbeanstalk/home)
- Create a new environment
- Create a web server environment
  - Web server environment
  - Select
  - Application name
  - Environment information
     - Name
     - domain
  - Managed platform
     - Python
     - ....
  - Sample application
  - Create environment


### [Install EB CLI](https://github.com/aws/aws-elastic-beanstalk-cli-setup)
- https://github.com/aws/aws-elastic-beanstalk-cli-setup
- python ./aws-elastic-beanstalk-cli-setup/scripts/ebcli_installer.py
- echo 'export PATH="~/.ebcli-virtual-env/executables:$PATH"' >> ~/.bashrc && source ~/.bashrc

### EB command

- Navigate to the project directory.
- `eb init`
  1. Select region number.
  2. **aws-access-id**
  3. **aws-secret-key**
  4. Select project number.
  5. CodeCommit **n**

- `eb health` check project health
- `eb logs` check project logs
- `eb ssh --setup` Setup ssh connection.

#### Run Command on the application
- `eb ssh <enviroment-name>`
- `cd /var/app/current` Navigate to the current path.
- `source $(find /var/app/venv/*/bin/activate)` Activate python venv.
- `export $(sudo cat /opt/elasticbeanstalk/deployment/env | xargs )` Load enviroment variables.
- `python -m app.main <command>` Run expected command.

### HTTPS on self-signed certificate
- Generate **self-signed** certificate
- Goto EB enviroment -> Configuration
- Edit **Load balancer**
- Add listener
  - Port: 443
  - Protocol: HTTPS
  - SSL certificate: Select imported certificate
  - SSL policy: Select latest policy
  - ADD
- Apply


## AWS CodePipline

- [Choose pipeline settings](https://us-east-2.console.aws.amazon.com/codesuite/codepipeline/pipeline/new)
  1. Pipeline name
  2. Next
- Sourse
  1. Github (Version 2)
  2. Connection
  3. Repository name
  4. Branch Name
  5. CodePipeline default
  6. Next


## Certificate Manager


### Import Self-Signed certificate
- Create certificate and key with OpenSSL
- [Import Certificate](https://us-east-2.console.aws.amazon.com/acm/home?region=us-east-2#/certificates/import)
- Submit **Certificate body** and **Certificate private key** that create with open ssl
- 