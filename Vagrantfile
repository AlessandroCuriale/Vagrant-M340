
Vagrant.configure("2") do |config|
  BOX_IMAGE = "ubuntu/jammy64"

  NO_PROXY = "localhost,127.0.0.1"
  
  WEB_IP = ".10"
  DB_IP = ".11"
  BASE_HOST_ONLY_NETWORK = "192.168.56"
  BASE_INT_NETWORK = "10.10.20"
  PROXY_ENABLE = true
  PROXY_URL  = "http://10.20.5.51:8888"

  config.ssh.insert_key = false
  config.vm.box_check_update = false
  
  
  if Vagrant.has_plugin?("vagrant-proxyconf")
    if(PROXY_ENABLE)
      config.proxy.http     = PROXY_URL
      config.proxy.https    = PROXY_URL
      config.proxy.no_proxy = NO_PROXY
	end
  end
  
  config.vm.define "web.m340" do |webconfig|
    webconfig.vm.provider "virtualbox" do |vb|
      vb.gui = true
	  vb.name = "web.m340"

      vb.memory = "1024"
    end
	webconfig.vm.network "private_network", ip: BASE_HOST_ONLY_NETWORK + WEB_IP
	webconfig.vm.network "private_network", ip: BASE_INT_NETWORK + WEB_IP, virtualbox__intnet: true

    webconfig.vm.box = BOX_IMAGE
	webconfig.vm.provision "shell", path: "./scripts/webCommands.sh"
	webconfig.vm.synced_folder "./site", "/var/www/html"
  end

  config.vm.define "db.m340" do |dbconfig|
	dbconfig.vm.provider "virtualbox" do |vb|
      vb.gui = true
	  vb.name = "db.m340"

      vb.memory = "1024"
    end
	dbconfig.vm.network "private_network", ip: BASE_INT_NETWORK + DB_IP, virtualbox__intnet: true

    dbconfig.vm.box = BOX_IMAGE
	dbconfig.vm.provision "shell", path: "./scripts/dbCommands.sh"
  end
end
