PWD := $(shell pwd)
IMAGE ?= ansible
TAG ?= latest

build:
	docker build -t $(IMAGE):$(TAG) .

run:
	docker run -it --rm -v $(PWD):$(PWD) $(IMAGE):$(TAG) sh

ansible:
	docker run -it --rm \
		-v ~/.ssh:/root/.ssh \
		-v ~/.aws:/root/.aws \
		-v $(PWD):$(PWD) -w $(PWD) $(IMAGE):$(TAG) ansible $(MAKEFLAGS)

check:
	docker run -it --rm \
		-v ~/.ssh:/root/.ssh \
		-v ~/.aws:/root/.aws \
		-v $(PWD):$(PWD) -w $(PWD) $(IMAGE):$(TAG) ansible-playbook eks-playbook/create-eks.yml --diff --check

cluster:
	docker run -it --rm \
		-v ~/.ssh:/root/.ssh \
		-v ~/.aws:/root/.aws \
		-v $(PWD):$(PWD) -w $(PWD) $(IMAGE):$(TAG) ansible-playbook eks-playbook/create-eks.yml

delete-cluster:
	docker run -it --rm \
		-v ~/.ssh:/root/.ssh \
		-v ~/.aws:/root/.aws \
		-v $(PWD):$(PWD) -w $(PWD) $(IMAGE):$(TAG) ansible-playbook eks-playbook/delete-eks.yml