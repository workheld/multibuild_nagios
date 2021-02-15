#!/bin/bash

# Bash "strict mode", to help catch problems and bugs in the shell
# script. Every bash script you write should include this. See
# http://redsymbol.net/articles/unofficial-bash-strict-mode/ for
# details.
set -euo pipefail

# Tell apt-get we're never going to be able to give manual
# feedback:
export DEBIAN_FRONTEND=noninteractive

# Update the package listing, so we know what package exist:
apt-get update

# Install security updates:
apt-get -y upgrade

# Install new packages for nagios install
apt-get install -y apt-get install wget apt-transport-https ca-certificates

echo "deb https://repo.nagios.com/deb/$(lsb_release -cs) /" > /etc/apt/sources.list.d/nagios.list

# Add our public GPG key
wget -qO - https://repo.nagios.com/GPG-KEY-NAGIOS-V2 | apt-key add -

# Update your repositories
apt-get update

# Delete cached files we don't need anymore:
apt-get clean
rm -rf /var/lib/apt/lists/*
