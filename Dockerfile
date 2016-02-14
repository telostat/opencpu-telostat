## Using the official ubuntu image:
FROM ubuntu:14.04

## Preamble:
MAINTAINER Vehbi Sinan Tunalioglu <vst@vsthost.com>

## Define versions required:
ENV VERSION 0.0.1

## Prepare apt-get:
RUN echo "debconf debconf/frontend select Noninteractive" | debconf-set-selections && \
    apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get install -y software-properties-common && \
    sudo add-apt-repository -y ppa:opencpu/opencpu-1.5 && \
    apt-get update -qy && \
    apt-get install -qy \
            nano \
            unzip \
            opencpu && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose required ports:
EXPOSE 80
EXPOSE 8004

# Set the command:
CMD service opencpu restart && tail -F /var/log/opencpu/apache_access.log
