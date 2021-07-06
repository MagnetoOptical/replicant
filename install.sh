#!/bin/bash

# Copyright (C) 2021 Sean Seago
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

GPGKEY_LIST=("https://download.docker.com/linux/debian/gpg")

REPO_LIST=("deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable")

APP_LIST=("apt-transport-https" "ca-certificates" "curl" "gnupg2" "software-properties-common" "docker-ce" "ansible") 


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
