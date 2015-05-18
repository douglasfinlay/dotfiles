#!/bin/bash

################################################################################
# File:    install.sh                                                          #
# Author:  Douglas Finlay (douglas@douglasfinlay.com)                          #
#                                                                              #
# Symlinks the desired dotfiles to the home directory. Updates git submodules  #
# and runs custom post-install commands.                                       #
################################################################################

# Add files to be symlinked here
files="dunstrc vimrc vim conkyrc conky gitconfig tmux.conf"

dir=~/dotfiles


function post_install {
:
}

function create_symlinks {
for file in $files;
do
    # Force creation of symlinks
    ln -sf $dir/$file $HOME/.$file && echo "Created symlink for ~/.$file"
done
}

function main() {
while true; do
    read -p "Existing dotfiles may be overwritten. Continue? (y/N) " c
    case $c in
        [Yy]* ) create_symlinks
            echo -e "\n=== Updating Git submodules ==="
            git submodule init
            git submodule update
            echo -e "\n=== Running post-install commands ==="
            post_install
            break;;
        * ) exit;;
    esac
done
}

main $@

