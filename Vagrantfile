Vagrant.configure("2") do |config|

  config.vm.define "kmaster" do |kmaster|
    
    config.vm.provision "shell", path: "bootstrap.sh"

    kmaster.vm.box = "centos/7"
    kmaster.vm.hostname = "kmaster.test.com"
    kmaster.vm.network "private_network", ip: "172.168.10.100"
    kmaster.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible-stuff/kmaster-playbook.yml"
      ansible.extra_vars = {
          node_ip: "172.168.10.100",
      }
  end
    kmaster.vm.provider "virtualbox" do |v|
      v.name = "kmaster"
      v.memory = 2048
      v.cpus = 2
    end
  end

  NodeCount = 2

  (1..NodeCount).each do |i|
    config.vm.define "kworker#{i}" do |worker|
      worker.vm.hostname = "kworker#{i}.test.com"
      worker.vm.box = "centos/7"
      worker.vm.network "private_network", ip: "172.168.10.10#{i}"
      worker.vm.provision "ansible" do |ansible|
        ansible.playbook = "ansible-stuff/kworker-playbook.yml"
        ansible.extra_vars = {
          node_ip: "172.168.10.10#{i}"
        }
      worker.vm.provider "virtualbox" do |v|
        v.name = "kworker#{i}"
        v.memory = 1024
        v.cpus = 1
      end
    end
  end
  end

  config.vm.define "rancher-master" do |rmaster|
    rmaster.vm.box = "centos/7"
    rmaster.vm.hostname = "rancher.test.com"
    rmaster.vm.network "private_network", ip: "172.168.10.99"
    rmaster.vm.network "forwarded_port", guest: 80, host: 80
    rmaster.vm.network "forwarded_port", guest: 443, host: 8443
    rmaster.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible-stuff/rancher-playbook.yml"
      ansible.extra_vars = {
        node_ip: "172.168.10.99"
      }
    end
    rmaster.vm.provider "virtualbox" do |v|
      v.name = "rmaster"
      v.memory = 2048
      v.cpus = 2
    end
  end
end
