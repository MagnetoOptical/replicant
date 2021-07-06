#!/bin/bash

GPGKEY_LIST = ("https://download.docker.com/linux/debian/gpg")

REPO_LIST = ("deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable")

APP_LIST = ("apt-transport-https" "ca-certificates" "curl" "gnupg2" "software-properties-common" "docker-ce" "ansible") 


function install_keys {
    KEY = $1
}

function install_repo {
    REPO = $1
    sudo add-apt-repository $1
}

function install_app {
    PACKAGE = $1
    # Test if docker-ce is installed
    apt list --installed | grep $APPLICATION 2>/dev/null
    [[ $? -eq 1 ]]; then
        sudo apt install -y $1
    fi
}

# Add keys
for key in "${GPGKEY_LIST[@]}"
do
    install_keys $key
done

# Add repos
for repo in "${REPO_LIST[@]}"
do
    install_repo $repo
done

# Install packages
for package in "${APP_LIST[@]}"
do
    install_app $package
done
