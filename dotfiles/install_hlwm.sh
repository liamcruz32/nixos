#!/bin/bash

hlwm="$PWD/config/herbstluftwm"
polybar="$PWD/config/polybar"

echo "Checking directory: Polybar"
if [[ ! -d $HOME/.config/polybar ]]
then
    mkdir -pv $HOME/.config/polybar
fi

for file in $(ls $polybar)
do
    ln -s -f $polybar/$file $HOME/.config/polybar/$file
done

echo "Checking directory: HerbstluftWM"
if [[ ! -d $HOME/.config/herstlufwm ]]
then
    mkdir -pv $HOME/.config/herbstluftwm
fi

for file in $(ls -p $hlwm | grep -v /)
do
    ln -s -f $hlwm/$file $HOME/.config/herbstluftwm/$file
done
