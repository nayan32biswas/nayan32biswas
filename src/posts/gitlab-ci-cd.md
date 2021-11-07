# GITLAB CI-CD

## Gitlab-runner

### [Setup](https://docs.gitlab.com/runner/install/linux-manually.html)

- `sudo apt-get update`
- `sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64`
- `sudo chmod +x /usr/local/bin/gitlab-runner`
- `sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash`
- `sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner`
- `sudo gitlab-runner start`

### [Registering Runners](https://docs.gitlab.com/runner/register/index.html)
```sh
sudo gitlab-runner register --non-interactive --url "https://gitlab.com/" --registration-token "<PROTECTED_TOKEN>" \
  --executor "docker" --docker-image alpine:latest --description "docker-runner" --tag-list "docker,build" \
  --run-untagged="false" --locked="false" --access-level="not_protected" 
```
- `docker login registry.gitlab.com`
### Command 

- `sudo gitlab-runner start`
- `sudo gitlab-runner stop`
- `gitlab-runner --version`

## CI-CD

- `docker login registry.gitlab.com` First login.

## Config Example

- File Name **.travis.yml**

```yaml
image: docker:latest
services:
  - docker:dind

variables:
  DOCKER_HOST: tcp://docker:2375
  # DOCKER_DRIVER: overlay2
  CONTAINER_TEST_IMAGE: $CI_REGISTRY_IMAGE:$CI_BUILD_REF_SLUG
  CONTAINER_RELEASE_IMAGE: $CI_REGISTRY_IMAGE:latest

stages:
  - build
  - test

build:
  stage: build
  script:
    - docker login -u gitlab-ci-token -p $CI_BUILD_TOKEN $CI_REGISTRY
    - docker build -t $CONTAINER_TEST_IMAGE ./app
    - docker push $CONTAINER_TEST_IMAGE
  only:
    refs:
      - master
    variables:
      - $CI_COMMIT_MESSAGE =~ / build /

test:
  stage: test
  image: docker/compose
  script:
    - docker-compose build
    - docker-compose run --rm ./manage.py migrate
    # - docker-compose run --rm django pydocstyle
    # - docker-compose run --rm django flake8
    # - docker-compose run django coverage run -m pytest
  only:
    refs:
      - master
    variables:
      - $CI_COMMIT_MESSAGE =~ / build test /
```


## Error & Solution

### Job failed (system failure): prepare environment:

- Error for on of the `.bash*` file, I get this error for `.bash_logout` file
- `sudo nano /home/gitlab-runner/.bash_logout` Comment all the content in this file

```bash
# if [ "$SHLVL" = 1 ]; then
#     [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
# fi
```

### cannot create directory ‘/home/gitlab-runner/builds’: Permission denied

- `sudo chown -R gitlab-runner:gitlab-runner /home/gitlab-runner/` Solution

### File upload Permission denied

- `sudo cat "gitlab-runner ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers` set sudo user without password
