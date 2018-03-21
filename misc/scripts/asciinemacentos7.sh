#!/bin/bash

# Install required packages
yum install -y https://centos7.iuscommunity.org/ius-release.rpm
yum install -y git python36u

# Make sure locale is UTF-8
export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8

# Get asciinema
git clone https://github.com/asciinema/asciinema.git
cd asciinema
python3.6 -m asciinema --version
