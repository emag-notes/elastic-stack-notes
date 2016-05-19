#!/bin/sh

PROXY_HOST=$1

if [ "x${PROXY_HOST}" != "x" ]; then
cat << EOF > /etc/profile.d/proxy.sh
export http_proxy=${PROXY_HOST}
export https_proxy=${PROXY_HOST}
export ftp_proxy=${PROXY_HOST}
export no_proxy=localhost,127.0.0.1,192.168.100.10,192.168.100.11,192.168.100.12
EOF
fi
