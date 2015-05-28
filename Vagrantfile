# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
    config.vm.define "boot2docker"
    config.vm.box = "parallels/boot2docker"
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.synced_folder "/Users/bill/work/", "/work/", type: "nfs"
    config.ssh.username = 'docker'
    config.ssh.password = 'tcuser'
    # Fix busybox/udhcpc issue
    config.vm.provision :shell do |s|
      s.inline = <<-EOT
        if ! grep -qs ^nameserver /etc/resolv.conf; then
          sudo /sbin/udhcpc
        fi
        cat /etc/resolv.conf
      EOT
    end

    # Adjust datetime after suspend and resume
    config.vm.provision :shell do |s|
      s.inline = <<-EOT
        sudo /usr/local/bin/ntpclient -s -h pool.ntp.org
        date
      EOT
    end
end
