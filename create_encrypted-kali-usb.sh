#!/bin/bash
#Make sure to choose the drive associated with your USB.
##Need to build in user input
fdisk /dev/sda
##Neeed to build prompt displaying instructions or fully automate partition creation.
#Follow below instructions to create partition for persistence.
#n
#p
#ENTER
#ENTER
#ENTER
#w

##Need to create variable for partition.
#Replace partition with your partition info.
cryptsetup --verbose --verify-passphrase luksFormat /dev/sda3
cryptsetup luksOpen /dev/sda3 kali_USB
mkfs.ext3 -L persistence /dev/mapper/kali_USB
e2label /dev/mapper/kali_USB persistence
mkdir /mnt/kali_USB
mount /dev/mapper/kali_USB /mnt/kali_USB
echo "/ union" > /mnt/kali_USB/persistence.conf
umount /dev/mapper/kali_USB
cryptsetup luksClose /dev/mapper/kali_USB
