#!/bin/bash
echo "It may take some time to complete"
sudo apt update
sudo apt install -y nmap
sudo apt install -y golang-go
go install -v github.com/OWASP/Amass/v3/...@master
sudo cp ~/go/bin/amass /usr/bin
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sudo cp ~/go/bin/subfinder /usr/bin
pip install -r requerments.txt
