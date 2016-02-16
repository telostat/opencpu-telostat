## Using the official ubuntu image:
FROM ubuntu:14.04

## Preamble:
MAINTAINER Vehbi Sinan Tunalioglu <vst@vsthost.com>

## Define versions required:
ENV VERSION 0.0.3-SNAPSHOT

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
            pandoc \
            wget \
            opencpu \
            littler && \
    wget -O /tmp/pandoc.deb https://github.com/jgm/pandoc/releases/download/1.16.0.2/pandoc-1.16.0.2-1-amd64.deb && dpkg -i /tmp/pandoc.deb && rm /tmp/pandoc.deb && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Copy stuff:
COPY opt/ /opt/telostat

## Run setup script:
RUN /opt/telostat/bin/setup.sh

# Expose required ports:
EXPOSE 80
EXPOSE 8004

# Set the command:
CMD service opencpu restart && tail -F /var/log/opencpu/apache_access.log
