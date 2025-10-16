#!/bin/bash

source=$1
destination=$2

echo "Syncing directories from $source into $destination"

rsync -av --delete --exclude='node_modules/*' "$source" "$destination"
