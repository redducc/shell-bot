wget -O rclone.gz https://git.io/JJMSG
gzip -d rclone.gz
chmod 777 rclone;cp rclone /app/Shell-bot/notroot/usr/bin/
rm rclone && rm rclone.gz
