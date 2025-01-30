#!/usr/bin/env bash

# install script to /usr/local/bin/
cp ./cmd/systemd-boot-btrfs /usr/local/bin/systemd-boot-btrfs

# copy systemd units
cp ./systemd/systemd-boot-btrfs.service /etc/systemd/system/systemd-boot-btrfs.service
cp ./systemd/systemd-boot-btrfs.path /etc/systemd/system/systemd-boot-btrfs.path

# enable systemd units
systemctl enable --now systemd-boot-btrfs.service
systemctl enable --now systemd-boot-btrfs.path

boot_main_cfg=$(ls -f /boot/loader/entries/ | grep 'main')
if [[ ! "$boot_main_cfg" ]]; then
    boot_main_cfg=$(ls -tU -f /boot/loader/entries/ | grep '.conf' | awk 'NR==1 {print $1}')
fi

if [[ ! "$boot_main_cfg" ]]; then
    echo "could not find main-***.conf or oldest boot laoder file in /boot/loader/entries. you will need that!"
fi
echo "install is done."
