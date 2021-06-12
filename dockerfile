FROM ubuntu:18.04
LABEL maintainer="BenTheBuilder"
LABEL version="1.0.1"

# Set ENV VAR for noninteractive 
ENV DEBIAN_FRONTEND=noninteractive
 
# Install required dependencies
RUN apt-get update && \
    apt-get install -y gcc python-dev libkrb5-dev && \
    apt-get install -y software-properties-common && \
    apt-get install -y python3.8 && \
    apt-get install -y python3.8-dev python3.8-venv &&\
    apt-get install -y python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install --upgrade virtualenv

# Install Ansible and dependencies
RUN apt-get update && \
  pip3 install pywinrm[kerberos] && \
  apt install krb5-user -y && \ 
  pip3 install pywinrm && \
  pip3 install ansible