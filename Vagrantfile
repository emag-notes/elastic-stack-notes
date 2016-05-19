# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # cache
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  # common
  config.vm.box = "centos71"
  config.vm.box_url = "https://github.com/CommanderK5/packer-centos-template/releases/download/0.7.1/vagrant-centos-7.1.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision :shell do |shell|
    shell.path = "./provisioning/common/proxy.sh"
    shell.args = ""
  end

  config.vm.provision :shell, :path => "./provisioning/common/fast-mirror.sh"
  config.vm.provision :shell, :path => "./provisioning/common/yum-update.sh"
  config.vm.provision :shell, :path => "./provisioning/common/install-packages.sh"
  config.vm.provision :shell, :path => "./provisioning/common/timezone.sh"
  config.vm.provision :shell, :path => "./provisioning/common/localeconf.sh"
  config.vm.provision :shell, :path => "./provisioning/common/ntp.sh"
  config.vm.provision :shell, :path => "./provisioning/common/disable-firewalld.sh"

  # elasticsearch
  config.vm.define :logstash do |logstash|
    logstash.vm.hostname = "logstash"
    logstash.vm.network "private_network", ip: "192.168.150.10"
    logstash.vm.provision :shell, :path => "./provisioning/logstash/install-packages.sh"
    logstash.vm.provision :shell, :path => "./provisioning/logstash/settings.sh"
  end

  config.vm.define :es do |es|
    es.vm.hostname = "es"
    es.vm.network "private_network", ip: "192.168.150.11"
    # es.vm.provision :shell, :path => "./provisioning/es/install-packages.sh"
    # es.vm.provision :shell, :path => "./provisioning/es/settings.sh"
  end

  config.vm.define :kibana do |kibana|
    kibana.vm.hostname = "kibana"
    kibana.vm.network "private_network", ip: "192.168.150.12"
    # kibana.vm.provision :shell, :path => "./provisioning/kibana/install-packages.sh"
    # kibana.vm.provision :shell, :path => "./provisioning/kibana/settings.sh"
  end

end
