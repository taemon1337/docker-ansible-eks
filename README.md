# Docker Ansible EKS Cluster

Docker image for provisioning an EKS cluster with full AWS resources

## Usage

```bash
# build the image
make build

# run the image
make run

# run ansible from the image
make ansible

# run ansible in check_mode
make check

# provision the cluster
make cluster
```