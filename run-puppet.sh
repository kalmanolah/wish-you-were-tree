#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "You need to be root to run this script."
    exit 1
fi

DIR='/etc/puppet'
ENVIRONMENT='production'
puppet apply --environment=$ENVIRONMENT $DIR/environments/$ENVIRONMENT/manifests
