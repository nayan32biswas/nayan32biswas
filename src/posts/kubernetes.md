# KUBERNETES

## [Install Kubernetes](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

- `sudo apt-get update`
- `sudo apt-get install -y apt-transport-https`
- Make Sure docker installed.
- `sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2`
- `curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -`
- `echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list`
- `sudo apt-get update`
- `sudo apt-get install -y kubectl`
  
## [Install Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)

- `curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64; chmod +x minikube`
- `sudo mkdir -p /usr/local/bin/`
- `sudo install minikube /usr/local/bin/`
- `minikube start`
- `kubectl cluster-info`
- `minikube dashboard`

## Commands

- `kubectl apply -f <filename>.yaml` you can specify filename or file with path.
- `kubectl apply -f <folder_name>` It's apply all on this folder.
- `kubectl get pods`
- `kubectl get service`
- `minikube ip` Get IP replacement of localhost.
- `kubectl describe <object_type> <object_name>` Get all information of a specific running image
- `kubectl delete -f <filename>.yaml`
- `kubectl delete pod <pod_name>`
- `kubectl delete deployment <deployment_name>`
- `kubectl delete service <service_name>`
- `kubectl get deployments`
- `kubectl get pods -o wide`
- `kubectl set image <obj_type>/<obj_name> <container_name>=<image>:<version>` **like** `kubectl set image deployment/client-deployment client=nayan32biswas/client:v2`
- `kubectl get storageclass`
- `kubectl get pv`
- `kubectl get pvc`
- `kubectl create secret generic <secret_name>, --from-literal key=value` **Like** `kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf`
- `kubectl get secrets`

## [ingress-nginx](https://kubernetes.github.io/ingress-nginx/deploy/)

- `minikube addons enable ingress` For minikube
