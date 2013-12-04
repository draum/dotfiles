#!/bin/bash
########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bash_profile vim vimrc"    # list of files/folders to symlink in homedir

##########

echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

cd bash-it

git submodule init
git submodule update
 
cd ..

if [ ! -h ~/.bash_it ]
then
    echo -n "Creating symlink to bash-it..."
    ln -s ~/dotfiles/bash-it ~/.bash_it
    echo "done"
fi

echo -n "Copying customizations into bash-it ..."
cp -R bash-it-overrides/* bash-it
echo "done"

source ~/.bash_profile
