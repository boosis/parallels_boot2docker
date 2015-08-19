#!/usr/bin/env bash

vagrant ssh -c "sudo rsync -avh /var/lib/boot2docker/tls /vagrant"
export DOCKER_TLS_VERIFY="1"
export DOCKER_CERT_PATH="`pwd`/tls"
export DOCKER_HOST="tcp://`vagrant ssh-config | sed -n "s/[ ]*HostName[ ]*//gp"`:2376"