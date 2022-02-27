#!/bin/bash

SRC=$1    #/mnt/ram
DEST=$2   #/mnt/main

echo "Syncing directories from $SRC into $DEST"

rsync -av --delete --exclude='node_modules/*' $SRC/code $DEST
rsync -av --delete $SRC/.npm $DEST
rsync -av --delete $SRC/pkgbuild $DEST
