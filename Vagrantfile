Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "selinux-lab"
  # config.vm.network "private_network", type: "dhcp"
  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end

  config.vm.provision "shell", inline: <<-SHELL
    echo "nameserver 8.8.8.8" > /etc/resolv.conf
  SHELL

  config.vm.provision "shell", path: "provision.sh"
end
