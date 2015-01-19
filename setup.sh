#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$EUID" -ne 0 ]
    then echo "You need to be root to run this script."
    exit 1
fi

apt-get update
apt-get install -y puppet

rm -rf /etc/puppet
ln -s $DIR /etc/puppet
