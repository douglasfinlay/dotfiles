#!/bin/bash

################################################################################
# install.sh                                                                   #
#                                                                              #
# Created by Douglas Finay (douglas@douglasfinlay.com)                         #
#                                                                              #
# Creates symlinks from the home directory to the desired dotfiles.            #
#                                                                              #
# TODO - script creates $backupdir even if it won't be used. Don't create this #
#        unnecessarily.                                                        #
################################################################################

# List of files/folders to be symlinked.
files="zshrc dunstrc vimrc vim conkyrc conky"

dir=~/dotfiles

# Directory to backup any existing dotfiles that will be replaced.
backupdir=~/dotfiles_old

# Create backup directory.
echo "Creating directory to backup any existing dotfiles..."
mkdir -p $backupdir
echo "Done."

# Create a backup of existing dotfiles, then create symlinks.
for file in $files; do
    if [ -f ~/.$file ]; then
        echo "$file exists in home directory. Moving to $backupdir."
        mv ~/.$file $backupdir
    fi
    echo "Creating symlink for $file."
    ln -s $dir/$file ~/.$file
done

################################################################################
# Specific Commands                                                            #
################################################################################
git submodule init && git submodule update

# Vim (command-t)
pushd vim/bundle/command-t/ruby/command-t
ruby extconf.rb && make
popd
