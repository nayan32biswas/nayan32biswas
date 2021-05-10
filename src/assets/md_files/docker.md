# DOCKER
## Installation Guid

### Uninstall old versions

```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
```

### Install using the repository

```bash
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

### Install using the convenience script

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

### INSTALL DOCKER ENGINE - COMMUNITY

```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
apt-cache madison docker-ce
```

## Install docker-compose

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## Initial Checking**

```bash
sudo docker -v
docker pull hello-world
sudo docker run hello-world
sudo docker images
```

## Login
- `docker login` dockerhub login
- `docker login registry.gitlab.com/<registry> -u <git_ursername>` registry login


## Most common Command

- `docker-compose build` Build new container
- `docker-compose up` Run Created container
- `docker-compose run --rm <service_name> base` Enter inside of running service that's own't effect.
- `docker rm <container_id>` Remove docker images.
- `docker rmi <image_id>` Remove docker images.
- `docker rm -f -v <container_name>; docker volume prune;` Remove data from specific container.

## All Docker command

- `docker build -t <new_image_name> -f Dockerfile .` Create new image and follow Dockerfile instractions.
- `docker run -it -p 8000:8000 <image_name>` Run your Container by port.
- `docker pull <image_name>` **Pull** image from docker hub.
- `docker build Dockerfile -t <container_name>` **Create new image** and follow Dockerfile instractions.
- `docker run <image_name>` This command run a image if exist otherwise it search or docker hub pull it and run it.
- `docker run <image_name>:1.0` Run specific version.
- `docker run <image_name> sleep 5` Run container and stope after 5 second.
- `docker run --cpus=.5 <image_name>` Run and limit the amount of processor container can use is 50%.
- `docker run --memory=100m <image_name>` Run and limit the amount of memory container can use is 100 MB.
- `docker run -i <image_name>` Run as interacive mode.
- `docker-compose exec server bash` Enter inside of running service, install and effect on action.
- `docker-compose exec server pipenv run bash` Enter inside of running service, install and effect on action also activate pipenv.
- `docker run -it <image_name>` Run as interacive mode and terminal.
- `docker run -p 80:5000 <image_name>` Run to specific port by using `-p` and port number and we can access on Run 80. We can run as many as same container by port maping.
- `docker run -d <container_name>` This is betach command. Container run into background process by using `-d`. It will return a long ID number.
- `docker attach <ID_NUM>` When we want to inter into background process run by `-d` then run this commend using `ID_NUM` get from batch command and assign firt few charecter of ID.
- `docker run -v /opt/datadir:/var/lib/<container_name> <container_name>` normaly docker have own file system and data stored on his file into `/var/liv/<container_name>` but after deleting container all file's and data was deleted. this command store data to `/opt/datadir` and though container is deleted but data is not delete inside of `/opt/datadir`.
- `docker run -e PASSWORD=DEMOPASSWORD <container_name>` set environment varibale and run the container.
- `docker run -e PASSWORD=DEMOPASSWORD <registry.io>/<username>/<container_name>` To run private registry.
- `docker run -v data_volume:/var/lib/<container_name> <container_name>` this line run created volume if not exists otherwise create and run.
- `docker run -v /data/mysql:/var/lib/<container_name> <container_name>` to derect specify container directory path
- `docker run --mount type=bind,source=/data/mysql,target=/var/lib/<container_name> <container_name>` same as upper and more details version.

- `docker exec <container_name> cat etc/hosts` here to execute someting we use `exec`.

- `docker ps` To **see** all running container's.
- `docker ps -a` **See** all running or stoped container's.
- `docker logs <container_name>` To see al log execute inside of this container in it is running into background process.
- `docker inspect <container_name>` To find all details of a container in a json formate. This also show environment variable.

- `docker stop <image_name>` To stope a running container.
- `docker rm <CONTAINER_ID>` **Removeing** container.
- `docker rmi <image_id>` **Removeing** image.
- `docker volume prune` Finally delete volume after removing container.

- `docker volume create data_volume` create volume to data voluem inside **/var/lib/docker/volumes/data_volume**
- `docker save <image_name> > <new_file>.tar` Save docker file.
- `docker exec -it <container-id> psql -U <username> -d <db_name> -c "DROP DATABASE <dbname>;"` action on postgres db
- `docker exec -it <container_name> psql -U postgres -d postgres` insert into database.

## [Docker Swarm](https://docs.docker.com/engine/swarm/)

- A **swarm is a group of machines** that are running Docker and joined into a cluster Docker Swarm is a tool for Container Orchestration
- Docker Swarm same as **Kubernetes**, **Apache Mesos**.

## Commands

Check machine created successfully

```bash
docker-machine ls
docker-machine ip <manager1>
```

- `docker-machine ssh <manager>` SSH (connect) to docker machine
- `docker node ls` Initialize Docker Swarm docker swarm init --advertise-addr MANAGER_IP (this command will work only in swarm manager and not in worker).
**Join workers in the swarm Get command for joining as worker In manager node run command**.
- `docker swarm join-token worker` This will give command to join swarm as worker
- `docker swarm join-token manager` This will give command to join swarm as manager.
**SSH into worker node (machine) and run command to join swarm as worker**.
- `docker node ls` In Manager Run command to verify worker is registered and is ready(Do this for all worker machines).
**On manager run standard docker commands**.
- `docker info` check the swarm section no of manager, nodes etc
- `docker swarm` Now check docker swarm command options
**Run containers on Docker Swarm**.
- `docker service create --replicas 3 -p 80:80 --name <serviceName> <nginx>`
**Check the status**.
- `docker service ls`
- `docker service ps <serviceName>` Check the service running on all nodes Check on the browser by giving ip for all nodes.
**Scale service up and down**.
- `docker service scale <serviceName>=2` On manager node.
- `docker node update --availability drain <worker1>` Shutdown node
**Update service**.
- `docker service update --image imagename:version web`
- `docker service update --image nginx:1.14.0 <serviceName>`
- `docker service rm <serviceName>` Remove service
- `docker swarm leave` to leave the swarm
- `docker-machine stop machineName` to stop the machine
- `docker-machine rm machineName` to remove the machine

## Problem & Solution

1. [1 Problem](https://stackoverflow.com/questions/48957195/how-to-fix-docker-got-permission-denied-issue)
Got permission denied while trying to connect to the Docker daemon socket at `unix:///var/run/docker.sock:` Get `http://%2Fvar%2Frun%2Fdocker.sock/v1.40/images/json`: dial unix `/var/run/docker.sock:` connect: permission denied.
[**Solution 1**](https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user)
Create the docker group if it does not exist
- `sudo groupadd docker`
- `sudo usermod -aG docker $USER`   Add your user to the docker group.
- `newgrp docker`   Run the following command or Logout and login again and run (that doesn't work you may need to reboot your machine first)
- `docker images`   Check if docker can be run without root
**Solution 2**.
- `sudo chmod 666 /var/run/docker.sock` Simple run this command.

2. Problem
    **ERROR: Encountered errors while bringing up the project**.
**Solution**.

```bash
docker-compose ps
docker-compose rm
```

3. Problem
**Pillow** installation problem.
**Solution**.
python:<python_version>-alpine does not support pillow.

4. Problem
ERROR: Couldn't connect to Docker daemon at http+docker://localhost - is it running?
**Solution**.
Same as **Promlem 1**.