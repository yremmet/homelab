#!/bin/bash

set -e
pw=$(gopass cat $1)
dir=/mnt/data/secrets/$(echo $1 | rev |cut -d/ --complement -f1 | rev)
name=$(echo $1 | rev |cut -d/ -f1 | rev)
mkdir -p $dir
echo $pw > $dir/$name
