# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX = "trusty64"
MEM = 512 

Vagrant.configure(2) do |config|

	hosts = [
		{ name: 'sheep-1', disk1: '/tmp/sheep-1-disk-1.vdi', disk2: '/tmp/sheep-1-disk-2.vdi', ip:'192.168.20.21' },
		{ name: 'sheep-2', disk1: '/tmp/sheep-2-disk-1.vdi', disk2: '/tmp/sheep-2-disk-2.vdi', ip:'192.168.20.22' },
		{ name: 'sheep-3', disk1: '/tmp/sheep-3-disk-1.vdi', disk2: '/tmp/sheep-3-disk-2.vdi', ip:'192.168.20.23' },
	]

	hosts.each do |host|
		config.vm.define host[:name] do |node|
			node.vm.hostname = host[:name]
			node.vm.box	= BOX
			node.vm.network :private_network, ip: host[:ip] 
			node.vm.provider :virtualbox do |vb|
				vb.name = host[:name]
				vb.memory = MEM 
				vb.customize ['createhd', '--filename', host[:disk1], '--size', 10*1024]
				vb.customize ['createhd', '--filename', host[:disk2], '--size', 10*1024]
				vb.customize ['storageattach', :id, '--storagectl', 
									"SATAController", '--port', 1, '--device', 0, '--type', 'hdd', '--medium', host[:disk1] ]
				vb.customize ['storageattach', :id, '--storagectl', 
									"SATAController", '--port', 2, '--device', 0, '--type', 'hdd', '--medium', host[:disk2] ]
			node.vm.provision :shell, :path => "examples/common.sh"
			end
			    
		end

	end

end
