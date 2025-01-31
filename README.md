## Whait is Systemd-boot-btrfs?

Systemd-boot-btrfs is a primitive systemd unit that creates automatically boot entry files /boot/loader/entries/arch-snapshots-\*.conf for systemd-boot, from each btrfs snapshot that is located in /.snapshots.
It concludes a systemd.path unit to watch /.snapshots for any changes to trigger the service.

## Install

```bash
git clone https://github.com/maslias/systemd-boot-btrfs.git
cd ./systemd-boot-btrfs
sudo ./install.sh
```

## Requirement

You need a major boot item /boot/loader/entries/\*conf file (main-\*\*\*.conf, if not, systemd-boot-btrfs will look for the oldest .conf file) with at least one option for 'rootflags=subvol='.

This is an example of loader files launching Arch:

```bash
title Arch Linux
linux   /vmlinuz-linux
initrd  /initramfs-linux.img
options rootflags=subvol=@ rootfstype=btrfs rw
```

For more information, check out the [arch wiki article](https://wiki.archlinux.org/title/Systemd-boot).
