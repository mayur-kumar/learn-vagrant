Vagrant.configure("2") do |config|

  config.vm.define "kmaster" do |kmaster|
    
    config.vm.provision "shell", path: "bootstrap.sh"

    kmaster.vm.box = "centos/7"
    kmaster.vm.hostname = "kmaster.test.com"
    kmaster.vm.network "private_network", ip: "172.168.10.100"
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
      worker.vm.provider "virtualbox" do |v|
        v.name = "kworker#{i}"
        v.memory = 2048
        v.cpus = 1
      end
    end
  end

  end
