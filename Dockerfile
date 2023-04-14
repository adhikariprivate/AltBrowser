FROM ubuntu:latest
RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install curl -y \
    && apt install unzip -y
RUN curl -O 'https://raw.githubusercontent.com/developeranaz/Rclone-olderversion-Backup/main/rclone-current-linux-arm64.zip' && \
    unzip rclone-current-linux-arm64.zip && \
    cp /rclone-*-linux-arm64/rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone
COPY entrypoint.sh /entrypoint.sh 
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh