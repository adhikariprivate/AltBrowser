# Configure Rclone
if [ $NO_OF_UNION_BASE == "one" ]; then
    rclone config create 'U0' 'mega' 'user' $MEGA_USER_1 'pass' $MEGA_PASS_1
    
elif [ $NO_OF_UNION_BASE == "two" ]; then
    rclone config create 'U1' 'mega' 'user' $MEGA_USER_1 'pass' $MEGA_PASS_1
    rclone config create 'U2' 'mega' 'user' $MEGA_USER_2 'pass' $MEGA_PASS_2
    rclone config create 'U0' 'union' upstreams "U1:/ U2:/"

elif [ $NO_OF_UNION_BASE == "three"]; then
    rclone config create 'U1' 'mega' 'user' $MEGA_USER_1 'pass' $MEGA_PASS_1
    rclone config create 'U2' 'mega' 'user' $MEGA_USER_2 'pass' $MEGA_PASS_2
    rclone config create 'U3' 'mega' 'user' $MEGA_USER_3 'pass' $MEGA_PASS_3
    rclone config create 'U0' 'union' upstreams "U1:/ U2:/ U3:/"

elif [ $NO_OF_UNION_BASE == "four"]; then
    rclone config create 'U1' 'mega' 'user' $MEGA_USER_1 'pass' $MEGA_PASS_1
    rclone config create 'U2' 'mega' 'user' $MEGA_USER_2 'pass' $MEGA_PASS_2
    rclone config create 'U3' 'mega' 'user' $MEGA_USER_3 'pass' $MEGA_PASS_3
    rclone config create 'U4' 'mega' 'user' $MEGA_USER_4 'pass' $MEGA_PASS_4
    rclone config create 'U0' 'union' upstreams "U1:/ U2:/ U3:/ U4:/"

elif [ $NO_OF_UNION_BASE == "five"]; then
    rclone config create 'U1' 'mega' 'user' $MEGA_USER_1 'pass' $MEGA_PASS_1
    rclone config create 'U2' 'mega' 'user' $MEGA_USER_2 'pass' $MEGA_PASS_2
    rclone config create 'U3' 'mega' 'user' $MEGA_USER_3 'pass' $MEGA_PASS_3
    rclone config create 'U4' 'mega' 'user' $MEGA_USER_4 'pass' $MEGA_PASS_4
    rclone config create 'U5' 'mega' 'user' $MEGA_USER_5 'pass' $MEGA_PASS_5
    rclone config create 'U0' 'union' upstreams "U1:/ U2:/ U3:/ U4:/ U5:/"
fi

rclone serve webdav U0:/ --addr 0.0.0.0:$PORT --vfs-cache-mode full --vfs-read-chunk-size 256M --vfs-read-chunk-size-limit 2G --user $DAV_USER --pass $DAV_PASS