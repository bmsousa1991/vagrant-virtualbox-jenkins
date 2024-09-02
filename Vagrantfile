Vagrant.configure("2") do |config|

  config.vm.define "Devops" do |dev1|
    dev1.vm.box = "generic/ubuntu2204"
    dev1.vm.box_check_update = true
    dev1.vm.hostname = "Devops"

    dev1.vm.network "forwarded_port", guest: 80, host: 8080
    dev1.vm.network "private_network", ip: "192.168.56.10"

    dev1.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "8200"
      vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
      vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
      vb.name = "Devops"
    end

    dev1.vm.provision "shell", path: "config.sh"
  end
end
