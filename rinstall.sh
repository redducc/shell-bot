#!/bin/bash
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip
cd rclone-*-linux-amd64
cp rclone /usr/bin/
chmod 755 /usr/bin/rclone

wget -qO gclone.gz https://git.io/JJMSG
gzip -d gclone.gz
mv gclone /usr/bin/
chmod 755 /usr/bin/rclone
