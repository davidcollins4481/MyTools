#!/bin/bash

install_debian_pkgs() {
    for pkg in `cat $PWD/etc/debian_pkgs`; do
        is_installed=$(dpkg -s ${pkg} 2>/dev/null | grep 'Status:' | grep 'install ok installed')
        echo "Checking for: $pkg"
        if [ "$is_installed" == "" ]; then
            # package is not installed...install it
            sudo apt-get install $pkg
        fi
    done
}

# check if we want to install any packages first
while getopts "s:" opt; do
    case $opt in
    s)
        if [ $OPTARG == "debian" ]; then
            echo "installing debian packages..."
            install_debian_pkgs
        fi
        ;;
  esac
done

# show hidden files
shopt -s dotglob

echo "Symlinking config files..."

for file in $PWD/conf/*; do
    # get the file name
    base=$(basename $file)

    # back up the old...don't want to destroy anything
    mv $HOME/$base $HOME/$base.bak
    ln -s $PWD/conf/$base $HOME
done

echo "Symlinking bin directory"

if [ -d $HOME/bin ]; then
    # moving it...need this available
    echo "Moving old bin directory to $HOME/bin_backup"
    mv $HOME/bin $HOME/bin_backup
fi

ln -s $PWD/bin $HOME

echo "Copying vim color scheme"
mkdir -p $HOME/.vim/{colors,}
cp $PWD/extras/nazca.vim $HOME/.vim/colors

echo "done"
exit 0

