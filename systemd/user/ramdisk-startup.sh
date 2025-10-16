#!/bin/bash

# Setup of ramdisk folders and copy of initial data

source=$1
destination=$2

echo "Syncing directory from $source storage into $destination"

rsync -av --exclude='node_modules/*' "$source" "$destination"
