# AWS Elastic Beanstalk

## [Create Project](https://us-east-2.console.aws.amazon.com/elasticbeanstalk/home)
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


## [Install EB CLI](https://github.com/aws/aws-elastic-beanstalk-cli-setup)
- https://github.com/aws/aws-elastic-beanstalk-cli-setup
- python ./aws-elastic-beanstalk-cli-setup/scripts/ebcli_installer.py
- echo 'export PATH="~/.ebcli-virtual-env/executables:$PATH"' >> ~/.bashrc && source ~/.bashrc

## EB command

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

### Run Command on the application
- `eb ssh <enviroment-name>`
- `cd /var/app/current` Navigate to the current path.
- `source $(find /var/app/venv/*/bin/activate)` Activate python venv.
- `export $(sudo cat /opt/elasticbeanstalk/deployment/env | xargs )` Load enviroment variables.
- `python -m app.main <command>` Run expected command.
