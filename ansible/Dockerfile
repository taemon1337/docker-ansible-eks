FROM alpine/ansible:latest AS ansible-base

RUN apk add --no-cache python3 py3-pip py3-virtualenv aws-cli

WORKDIR /app

# create a python virtualenv
RUN python3 -m venv /opt/venv

# set virtual env to default
ENV PATH="/opt/venv/bin:$PATH"

COPY ./requirements.* .

RUN pip install --no-cache-dir -r requirements.txt

RUN ansible-galaxy collection install -r requirements.yml

FROM ansible-base AS final-image

COPY ./ .