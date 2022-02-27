#!/bin/bash

# Setup of ramdisk folders and copy of initial data

SRC_DIR=$1    # /mnt/main
DEST_DIR=$2   # /mnt/ram
LINK_DIR=$3   # ~

echo "Syncing directories from $SRC_DIR storage into $DEST_DIR"

rsync -av --exclude='node_modules/*' $SRC_DIR/code $DEST_DIR
rsync -av $SRC_DIR/.npm $DEST_DIR
rsync -av $SRC_DIR/pkgbuild $DEST_DIR

echo "Linking directories to $LINK_DIR"

rm -rf $LINK_DIR/.npm $LINK_DIR/code $LINK_DIR/pkgbuild
ln -s $DEST_DIR/.npm $LINK_DIR
ln -s $DEST_DIR/code $LINK_DIR
ln -s $DEST_DIR/pkgbuild $LINK_DIR

