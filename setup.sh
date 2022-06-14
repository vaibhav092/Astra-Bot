#!/bin/bash

o=$(cat /etc/os-release | grep PRETTY_NAME)
RED="\e[31m"
ENDCOLOR="\e[0m"
#echo $o
#declare -a packages=("sudo apt update" "sudo apt upgrade")
if [ "$o" == 'PRETTY_NAME="Ubuntu 22.04 LTS"' ]
then 
	echo "it's ok"
       #for i in "${packages[@]}"; do `$i`; done
	echo "installing"
	echo "It may take some time to complete"
	sudo apt-get update
	sudo apt-get install -y nmap
	
	echo "Installing Golang into your Device"
	wget https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz
	sudo tar -xvf go1.13.5.linux-amd64.tar.gz
	sudo mv go /usr/local
	export GOROOT=/usr/local/go
	export GOPATH=$HOME/go
	export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
	echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
	echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
	echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
	source ~/.bash_profile
	sleep 1
        echo "Installation done " 
        echo 
	export GO111MODULE=on
	go get -v github.com/OWASP/Amass/v3/...
	echo
	echo "Amass installation completed"	
	sudo apt-get install python3 python3-pip
	go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
	sudo cp ~/go/bin/subfinder /usr/bin
	pip install -r requirements.txt

else
	echo -e "${RED} This script is tested on Ubuntu 22.04 LTS u may face some error . if u still want to continue press y ${ENDCOLOR}"
 	read a
fi

if [ "$a" == "y" ]
then 
	echo "installing"
	echo "It may take some time to complete"
	sudo apt update
	sudo apt install -y nmap
	echo "Installing Golang into your Device"
	wget https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz
	sudo tar -xvf go1.13.5.linux-amd64.tar.gz
	sudo mv go /usr/local
	export GOROOT=/usr/local/go
	export GOPATH=$HOME/go
	export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
	echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
	echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
	echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
	source ~/.bash_profile
	sleep 1    
        echo "Installation done " 
        echo 
	export GO111MODULE=on
	go get -v github.com/OWASP/Amass/v3/...
	echo
	echo "Amass installation completed"	
	sudo apt install python3 python3-pip
	go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
	sudo cp ~/go/bin/subfinder /usr/bin
	pip install -r requirements.txt
fi
