#!/bin/bash

# Install required packages
yum install -y https://centos7.iuscommunity.org/ius-release.rpm
yum install -y git python36u

# Get asciinema
git clone https://github.com/asciinema/asciinema.git
