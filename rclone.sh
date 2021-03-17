wget -O rclone.gz https://git.io/JJMSG
gzip -d rclone.gz
chmod 777 rclone;mkdir /app/Shell-bot/notroot/usr;mkdir /app/Shell-bot/notroot/usr/bin 
cp rclone /app/Shell-bot/notroot/usr/bin/ ; rm rclone
