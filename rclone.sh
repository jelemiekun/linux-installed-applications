#!/usr/bin/env bash

sleep 60

echo "Script started at $(date)" >>/home/jelemikun/rclone_startup.log

notify-send "rclone" "Initializing Google Drive mounts..."

/usr/bin/rclone mount --daemon --dir-cache-time 20s --poll-interval 60s gdrive1: /home/jelemikun/gdrive1/ >>/home/jelemikun/rclone_startup.log 2>&1
/usr/bin/rclone mount --daemon --dir-cache-time 20s --poll-interval 60s gdrive2: /home/jelemikun/gdrive2/ >>/home/jelemikun/rclone_startup.log 2>&1

notify-send "rclone" "Google Drive mounts started."
