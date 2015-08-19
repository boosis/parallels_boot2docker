#!/usr/bin/env bash

vagrant ssh -c "sudo rsync -avh /var/lib/boot2docker/tls /vagrant"