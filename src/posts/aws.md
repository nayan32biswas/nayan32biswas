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

## NAT Gateway
- [Create NAT Gateway](https://us-east-1.console.aws.amazon.com/vpc/home?region=us-east-1#NatGateways:)
- [Create route table](https://us-east-1.console.aws.amazon.com/vpc/home?region=us-east-1#RouteTables:)
  - Allocate created VPC-<id> that created with NAT Gateway.
  - Update route table. Add `0.0.0.0/0` with target `nat-<id>` from NAT Gateway
- [Create Subnet]()

## Elastic Beanstalk

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



### Setup NAT Gateway

- [Create NAT Gateway](https://us-east-1.console.aws.amazon.com/vpc/home?region=us-east-1#NatGateways:)
  - Makesure you identify the name
- [Create Route Table for NAT Gateway](https://us-east-1.console.aws.amazon.com/vpc/home?region=us-east-1#CreateRouteTable:)
  - Makesure you identify the name
  - Edit route table
    - Edit routes
      - Destination 0.0.0.0/0
      - Target newly created nat-gateway
- [Create 2 Subnet for NAT Gateway](https://us-east-1.console.aws.amazon.com/vpc/home?region=us-east-1#CreateSubnet:)
  - Edit Subnet
    - Edit route table association inside **Route table**
    - Alocate default route tatble to route table for NAT Gateway

### Elastic Beanstalk with high availability

- Create new EBS web instance
  - To set up NAT Gateway Check **Configure More Option**
    - select high availability
    - Network
      - Load balancer subnets
        - select public subnet for public IP
      - Un mark **Public IP address**
      - Instance subnets
        - select private NAT Gateway for private IP
- Setup **WSGIPath** in Configuration -> software `app.main:app --worker-class=uvicorn.workers.UvicornWorker`
- Setup enviroment variable in Configuration -> software

  - Generate secrets with python command `secrets.token_hex(32)`.
  - Don't edit `PYTHONPATH` on env.
  - For firebase credintial create hash from firebase credintial file with `base64 admin-sdk.json`.

- Enable **Log streaming** for **Instance log streaming to CloudWatch Logs**.
- set `client_max_body_size 100M;` in **.platform/nginx/conf.d/proxy.conf** for upload content size.
- SSL certification
  - [Request ssl certificate](https://us-east-1.console.aws.amazon.com/acm/home?region=us-east-1#/certificates/request)
  - Set **CNAME name** and **CNAME value** if your domain provider with domain.


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


## [Elastic Beanstalk and CloudWatch Logs](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/AWSHowTo.cloudwatchlogs.html)

- View logs from **Logs -> Logs Insights** or **Martics -> Explore**

### Setup CloudWatch logs in EB
- Inside Application Configuration
- Edit Software settings
- Instance log streaming to CloudWatch Logs
  - Enable Log streaming

### CloudWatch Matircs
- Create [CloudWatch Dashboard](https://us-east-2.console.aws.amazon.com/cloudwatch/home)
  - Name
  - Select **Explore**
  - Select Elastic Beanstalk
  - Add filter matrics

### Filter CloudWatch nginx/access.log

- Logs Insights
  - Select `/aws/elasticbeanstalk/<application-env>/var/log/nginx/access.log`

```sql
fields @timestamp, @message
| sort @timestamp desc
| filter @message like " 500 " and @message like "GET"
| limit 20
```



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
  7. Add build stage
     1. Skip build stage
  8. Select **AWS Elastic Beanstalk**
     1. Select Project
     2. Select Project-env
  9. Save

### Problem and Solution

- **Problem**
- Deployment failed. The provided role does not have sufficient permissions:
- **Solution**
- To resolve the issue - Add **"logs:*"** in the Actions array of the first block. As this gives permission form EBS to Cloudwatch logs.


## Certificate Manager


### Import Self-Signed certificate
- Create certificate and key with OpenSSL
- [Import Certificate](https://us-east-2.console.aws.amazon.com/acm/home?region=us-east-2#/certificates/import)
- Submit **Certificate body** and **Certificate private key** that create with open ssl


## AWS WAF

### [WAF & Shield API rate limit](https://us-east-1.console.aws.amazon.com/wafv2/homev2/web-acls)

1. Setp 1
- Fillup name and CloudWatch metric name
- Add AWS resources
  - Select Application load balancer
- Next
- Rules
  - Add my own rules and rule group
    - Rule builder
    - name
    - rate-base rule
    - 100
    - Remain all other as default.
2. Remain all other as default.
3. Remain all other as default.
4. Remain all other as default.
5. Remain all other as default.
