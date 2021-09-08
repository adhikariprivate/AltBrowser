FROM nginx:1.19.6

# Download dependencies
RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install unzip -y

# Download and install rclone
RUN curl -O 'https://raw.githubusercontent.com/developeranaz/Rclone-olderversion-Backup/main/rclone-current-linux-amd64.zip' && \
    unzip rclone-current-linux-amd64.zip && \
    cp /rclone-*-linux-amd64/rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone

# Download filebrowser executable
RUN curl -O 'https://sauravadhikari.alwaysdata.net/api/public/dl/mdnBWypm' && \
    mv mdnBWypm filebrowser && \
    chmod +x filebrowser
    
COPY entrypoint.sh /entrypoint.sh 
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh