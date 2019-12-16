# cndw: Cloud Native Development Workstation
## A quick and easy way to get uniform cloud native development workstations setups across multiple platforms

A collection of binaries to work with cloud native apps and idempotent bash scripts to help you setup in minutes, on Linux, Mac or Windows


### Ubuntu Linux setup

`git clone git@github.com:raph/cndw.git`
`cd cndw/linux`
`./setup-ubuntu.sh`


### Mac

`git clone git@github.com:raph/cndw.git`
`cd cndw/linux`
`./setup.sh`


### Windows


## Usage

After running setup.sh, you can initiate your kubernetes environment using `minikube start --vm-driver=vmware` 

terraform, skaffold, bazel and kubectl are available from your path so you can start developing your kubernetes app right away

