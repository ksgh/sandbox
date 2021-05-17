ARG BASE_IMAGE=alpine
ARG BASE_TAG=latest

FROM ${BASE_IMAGE}:${BASE_TAG}

LABEL ksgh.image.long-name="Dev Container Sandbox" \
    ksgh.image.short-name="devcontainer" \
    ksgh.image.description="VSCode Dev Container: Misc Tooling" \
    ksgh.image.maintainer="kshenk (at) gmail (dot) com" \
    ksgh.image.license="https://www.apache.org/licenses/LICENSE-2.0.txt"

COPY ./python-requirements.txt /requirements.txt

RUN apk update && apk upgrade && \
    apk add \
        ## Install a bunch of things we want...
        bash curl jq python3 git htop sqlite vim openssl iputils bind-tools \
        ## ... and a bunch of things to support the things we want.
        gcc musl-dev python3-dev libffi-dev openssl-dev cargo ca-certificates && \
    rm -rf /var/cache/apk/* && \
    ## link up and situate python stuff
    ln -sf python3 /usr/bin/python && \
    python -m ensurepip && \
    ln -sf pip3 /usr/bin/pip && \
    ## Need wheel here prior to installing/building the openstack client (cryptography)
    pip install --no-cache --upgrade pip setuptools wheel && \
    pip install -r /requirements.txt && \
    ## Install Terraform
    wget https://releases.hashicorp.com/terraform/0.15.3/terraform_0.15.3_linux_amd64.zip && \
    unzip terraform_* && \
    mv terraform /usr/bin/ && \
    rm terraform_* && \
    \
    which terraform     && terraform -version && \
    which python        && python --version && \
    which ansible       && ansible --version
