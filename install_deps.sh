#!/bin/bash

echo "Installing some dependancies, in case they aren't here."

sudo apt-get install emacs24-nox emacs-goodies-el zsh 
sudo apt-get install python-pip python-dev
sudo pip install thefuck

curl -L http://install.ohmyz.sh | sh

