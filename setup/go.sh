#!/bin/bash

if ! command -v jq &> /dev/null
then
    echo "'jq' could not be found, and is required for this tool"
    exit 1
fi

version=$(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].version')
arch=linux-amd64
inst_loc="/usr/local"

echo "latest go version is:" $version
echo "arch is:" $arch
echo "install location:" $inst_loc

read -p "install? [Yy]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "installing..."
    artifact=$version.$arch.tar.gz

    wget https://go.dev/dl/$artifact -P /tmp/
    sudo rm -rf $inst_loc/go

    sudo tar -C $inst_loc -xzf /tmp/$artifact
    echo $PATH | grep "$inst_loc/go/bin"
    echo "installed"
    go version
else
    echo "exiting..."
fi
