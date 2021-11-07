## Config Example

- File Name **.travis.yml**

```yml
sudo: required

services:
  - docker

before_install:
  - docker build -t nayan32biswas/react .

script:
  - docker run nayan32biswas/react npm run test -- --coverage

deploy:
  provider: "<elasticbeanstalk>"
  region: "<us-west-2>"
  app: "<app_name>"
  env: "<Docker-env>"
  bucket_name: "<elasticbeanstalk-us-west-2-190283479284>"
  bucket_path: "<docker-app>"
  on:
    brance: master
  # for security parpes hide key on traves account by set Environment variable in app settings.
  access_key_id: $<ENV_FROM_TRAVES_CI_AC___ACCESS_KEY>
  secret_access_key:
    secure: "$<ENV_FROM_TRAVES_CI_AC___SECRET_KEY>"
```
