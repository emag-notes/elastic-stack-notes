#!/bin/sh

yum -y install ntp

sed -i "s/^server/#server/" /etc/ntp.conf
echo "server ntp.nict.jp" >> /etc/ntp.conf

systemctl start ntpd
systemctl enable ntpd
