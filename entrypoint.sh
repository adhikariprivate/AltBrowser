# Configure Rclone
rclone config create 'CLOUD_STORAGE' 'mega' 'user' $MEGA_USER 'pass' $MEGA_PASS

mkdir mountpoint

rclone mount CLOUD_STORAGE:/ mountpoint --allow-non-empty --vfs-cache-mode full --daemon

# Run the filebrowser
./filebrowser --address 0.0.0.0 --port $PORT --username $ADMIN_USER --password $ADMIN_PASSWORD