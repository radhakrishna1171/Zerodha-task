#!/bin/bash
echo install virtualbox
sudo apt-get install virtualbox -y
echo check the vagrant installed or not

#check the already installed or nor
test=$(dpkg --list | grep vagrant)

 if [ $? != 0 ]
    then
    sudo apt-get install vagrant -y
 else
    echo "already installed"
 fi
#Thiss script will crreate ubuntu vahrant box ( assuming all neceassy packages have been already installed 
# we will handle all Vagrant box in Vagrant Dir
 mkdir vagrant
 cd vagrant/
vagrant init hashicorp/precise32
sed -i 's/# config.vm.network "public_network"/config.vm.network "public_network"/g' Vagrantfile  #for connecting network

#vagrant up --provider=VIRTUALBOX
vagrant up # this will start the Box.
