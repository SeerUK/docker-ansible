FROM ubuntu:trusty
MAINTAINER Elliot Wright <elliot@elliotwright.co>

# Install Ansible
RUN \
    useradd -u 1000 -m -s /bin/bash ansible && \
    mkdir -p /app && \
    chown -R ansible: /opt && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER ansible

WORKDIR /app
