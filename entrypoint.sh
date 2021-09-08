# Configure Rclone
rclone config create 'U1' 'mega' 'user' $MEGA_USER_1 'pass' $MEGA_PASS_1
rclone config create 'U2' 'mega' 'user' $MEGA_USER_2 'pass' $MEGA_PASS_2
rclone config create 'U0' 'union' upstreams "U1:/ U2:/"

rclone serve webdav U0:/ --addr 0.0.0.0:$PORT --vfs-cache-mode full --vfs-read-chunk-size 256M --vfs-read-chunk-size-limit 2G --user $DAV_USER --pass $DAV_PASS