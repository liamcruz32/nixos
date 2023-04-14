#!/bin/bash

configDir="$PWD/config"

for dir in rofi dunst picom 
do
    echo "Checking directory: $dir"
    if [[ ! -d $HOME/.config/$dir ]]
    then
        mkdir -pv $HOME/.config/$dir
    fi

    for file in $(ls $PWD/config/$dir)
    do
        ln -s -f $PWD/config/$dir/$file $HOME/.config/$dir/$file
    done
done
