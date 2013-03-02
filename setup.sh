#!/bin/bash

#battery.sh
#cpu.sh
#ip.sh
#sms_notify.pl
#XMLTidy.pl
#.bashrc
#.screenrc
#.vimrc

# show hidden files
shopt -s dotglob

echo "Linking config files"

for file in $PWD/conf/*; do
    # get the file name
    base=$(basename $file)

    # back up the old...don't want to destroy anything
    mv $HOME/$base $HOME/$base.bak
    ln -s $PWD/conf/$base $HOME
done


