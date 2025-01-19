PWD := $(shell pwd)
IMAGE ?= terraform
TAG ?= latest

build:
	docker build -t $(IMAGE):$(TAG) .

run:
	docker run -it --rm -v $(PWD):$(PWD) -w $(PWD) --entrypoint=/bin/sh $(IMAGE):$(TAG) --

terraform:
	docker run -it --rm \
		-v ~/.aws:/root/.aws \
		-v $(PWD):$(PWD) -w $(PWD) $(IMAGE):$(TAG) $(MAKEFLAGS)

init:
	docker run -it --rm \
		-v ~/.aws:/root/.aws \
		-v $(PWD):$(PWD) -w $(PWD) $(IMAGE):$(TAG) init

plan:
	docker run -it --rm \
		-v ~/.aws:/root/.aws \
		-v $(PWD):$(PWD) -w $(PWD) $(IMAGE):$(TAG) plan

cluster:
	docker run -it --rm \
		-v ~/.aws:/root/.aws \
		-v $(PWD):$(PWD) -w $(PWD) $(IMAGE):$(TAG) apply

delete-cluster:
	docker run -it --rm \
		-v ~/.aws:/root/.aws \
		-v $(PWD):$(PWD) -w $(PWD) $(IMAGE):$(TAG) destroy