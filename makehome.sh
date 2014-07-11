#!/bin/bash

# Cheat to update all submodules quickly
# git submodule foreach "(git checkout master; git pull)&"

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="zshrc multitailrc dircolors vim vimrc emacs.d"

##########
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    if [ ! -L $file ]; then
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file ~/dotfiles_old/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
    fi
done

# Copy any zsh_custom stuffs
cp -R $dir/zsh_custom/* ~/.oh-my-zsh/custom

git submodule update --init

echo 'Now run "source ~/.zshrc" to finalize things.'
