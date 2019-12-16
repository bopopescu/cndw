#!/bin/bash

sudo apt install -y ca-certificates curl apt-transport-https lsb-release gnupg

# Add the Google Cloud SDK distribution URI as a package source
if [ ! -f /etc/apt/sources.list.d/google-cloud-sdk.list ]; then
   echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
fi

# Import the Google Cloud Platform public key
if [ ! -f /usr/share/keyrings/cloud.google.gpg ]; then
   curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
fi

# Download and install the Microsoft signing key
if [ ! -f /etc/apt/trusted.gpg.d/microsoft.asc.gpg ]; then
   curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
fi

#Add the Azure CLI software repository:
if [ ! -f /etc/apt/sources.list.d/azure-cli.list ]; then
   AZ_REPO=$(lsb_release -cs)
   if [ "$AZ_REPO" == "hera" ]; then 
   export AZ_REPO=bionic # Elementary OS 5.1 workaround
   fi 
   echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
fi

# Update repository information and install the packages:

sudo apt update -y
sudo apt install -y gcc linux-headers-$(uname -r) build-essential git ansible python-pip google-cloud-sdk azure-cli jq
sudo pip install awscli aws-shell

# DEVBINPATH="${PWD}/bin:$PATH"

# echo export PATH="$DEVBINPATH:$PATH" >> ~/.bashrc



DEVBINPATH="${PWD}/bin"
grep cndw ~/.bashrc > /dev/null 2> /dev/null
[[ "$?" != 0 ]] && echo export PATH=$DEVBINPATH:\$PATH >> ~/.bashrc
