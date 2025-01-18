# Docker Ansible EKS Cluster

Docker image for provisioning an EKS cluster with full AWS resources.

## Get Started

```bash
# clone the repo
git clone https://github.com/taemon1337/docker-ansible-eks.git

# ensure docker is installed
docker version

# build the ansible docker image
make build

# run the image and shell into it
make run

# run ansible from the image
make ansible

# run eks-playbook in check mode
make check

# create the eks cluster
make cluster

# delete the eks cluster
make delete-cluster
```