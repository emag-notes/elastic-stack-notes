#!/bin/sh

rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
cp /vagrant/provisioning/logstash/logstash.repo /etc/yum.repos.d/

yum -y install java-1.8.0-openjdk-devel logstash httpd
