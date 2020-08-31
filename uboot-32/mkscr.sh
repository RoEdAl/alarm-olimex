#!/bin/bash -e

if [[ ! -x /usr/bin/mkimage ]]; then
  echo "mkimage not found. Please install uboot-tools:"
  echo "  pacman -S uboot-tools"
  exit 1
fi

SOURCE_TS=$(date -r boot.txt -u '+%s')
env SOURCE_DATE_EPOCH=${SOURCE_TS} mkimage -A arm -O linux -T script -C none -n "Arch Linux ARM" -d boot.txt boot.scr
touch -c -d @${SOURCE_TS} boot.scr
