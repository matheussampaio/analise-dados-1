#!/usr/bin/env bash

apt-get update

# Instalando Dependencias:
apt-get install -y g++ curl libssl-dev apache2-utils unzip make gcc make build-essential r-base-core

wget http://nbcgib.uesc.br/mirrors/cran/bin/linux/ubuntu/precise/r-base_3.1.0.orig.tar.gz
tar -xf r-base_3.1.0.orig.tar.gz
cd R-3.1.0/

./configure --with-x=no
make