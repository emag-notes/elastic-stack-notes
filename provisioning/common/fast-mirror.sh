#!/bin/sh

echo "prefer=ftp.riken.jp" >> /etc/yum/pluginconf.d/fastestmirror.conf
yum clean all
