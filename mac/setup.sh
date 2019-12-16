#!/bin/bash


./google-cloud-sdk/install.sh

./google-cloud-sdk/bin/gcloud init


curl -L https://aka.ms/InstallAzureCli | bash

sudo pip install awscli aws-shell


# Add path to .bashrc if doesnt exist

DEVBINPATH="${PWD}/bin"
grep cndw ~/.bashrc > /dev/null 2> /dev/null
[[ "$?" != 0 ]] && echo export PATH=$DEVBINPATH:\$PATH >> ~/.bashrc

