#!/bin/bash
echo -e "$RCLONE_CONF" > ./rclone.conf

rclone serve webdav $SERVICE_NAME:$PATH --addr 0.0.0.0:$PORT --vfs-cache-mode full --vfs-read-chunk-size 256M --vfs-read-chunk-size-limit 2G --user $WEBDAV_USER --pass $WEBDAV_PASS --config ./rclone.conf