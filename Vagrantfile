# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # vagrant-omnibus is necessary
  config.omnibus.chef_version = :latest
  config.vm.hostname = 'rails-sket'

  config.vm.box = "centos-6.6"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box"
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision "chef_solo" do |chef|
    chef.custom_config_path = "config.chef"
    chef.cookbooks_path = "site-cookbooks"

    chef.add_recipe 'basic'
    chef.add_recipe 'ruby'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'mysql'

    chef.json = {
      "ruby" => {
        "user" => "vagrant",
        "group" => "vagrant"
      }
    }
  end

end
