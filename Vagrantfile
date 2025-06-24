username = `whoami`.strip

nodes = [
    { :hostname => username + 'VM', :ip => '192.168.56.110'},
]

Vagrant.configure("2") do |config|
    nodes.each do |node|
        config.vm.define node[:hostname] do |nodeconfig|
            nodeconfig.vm.provider "virtualbox" do |v|
                v.name = node[:hostname]
                v.cpus = 4
                v.memory = 4096
                v.customize ["modifyvm", :id, "--vram", "128"]
                v.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
            end
            nodeconfig.vm.box = "generic/arch"
            nodeconfig.vm.hostname = node[:hostname]

            nodeconfig.vm.network "private_network", ip: node[:ip]
            nodeconfig.ssh.insert_key = false

            nodeconfig.vm.synced_folder ".", "/vagrant", type: "virtualbox"

            # Execute VM Setup script
            nodeconfig.vm.provision "shell", path: "./VMSetup.sh", privileged: false

            # Restart VM
            nodeconfig.vm.provision "shell", inline: <<-SHELL
                echo "Restarting VM..."
                sudo shutdown -r now
            SHELL
        end 
    end
end
