#!/usr/bin/env bash

set -e

DISK=$1
DATA_DIR=$2
LOOP_DEV=$(sudo losetup -f)
MOUNT_POINT=mldisk
SIZE=100M

# Create a partition.
dd if=/dev/zero of=$DISK bs=$SIZE count=1

# Create a file system. 2048 * 512 = 1048576.
sudo losetup $LOOP_DEV $DISK
sudo mkfs.ext4 -q $LOOP_DEV

# Write an empty file to the file system.
mkdir $MOUNT_POINT
sudo mount $LOOP_DEV $MOUNT_POINT
sudo sh -c "cat <<EOF > $MOUNT_POINT/README
+-----------------+
| Monolinux Jiffy |
+-----------------+
EOF"

if [ -e "$DATA_DIR" ] ; then
    sudo cp -r $DATA_DIR $MOUNT_POINT
fi

sudo umount $MOUNT_POINT
rm -rf $MOUNT_POINT

sudo losetup -d $LOOP_DEV
