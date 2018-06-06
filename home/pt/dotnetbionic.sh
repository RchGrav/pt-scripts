#!/usr/bin/env bash


sudo apt-get install apt-transport-https -y
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/ubuntu/18.04/prod.list 
sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
sudo apt-get install apt-transport-https
sudo apt-get update -y
sudo apt-get install dotnet-sdk-2.1.200

echo "export DOTNET_CLI_TELEMETRY_OPTOUT" >> ~/.profile

