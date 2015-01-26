#!/bin/bash

################################################################################
# File:    install.sh                                                          #
# Author:  Douglas Finlay (douglas@douglasfinlay.com)                          #
#                                                                              #
# Symlinks the desired dotfiles to the home directory. Updates git submodules. #
################################################################################

# Add files to be symlinked here.
files="zshrc zshenv dunstrc vimrc vim conkyrc conky"

dir=~/dotfiles


function post_install {
# Vim (command-t)
pushd vim/bundle/command-t/ruby/command-t
ruby extconf.rb && make
popd
}

function create_symlinks {
for file in $files;
do
    # Force creation of symlinks
    ln -sf $dir/$file ~/.$file && echo "Created symlink for ~/.$file"
done
}

while true; do
    read -p "Existing dotfiles will be overwritten WITHOUT creating a backup. Continue? (Y/N) " c
    case $c in
        [Yy]* ) create_symlinks
            echo -e "\nUpdating Git submodules"
            git submodule init && git submodule update
            echo -e "\nRunning post-install commands"
            post_install
            break;;
        [Nn]* ) exit;;
    * ) echo "Please enter Y or N";;
esac
done

