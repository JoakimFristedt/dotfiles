#!/bin/bash

mkdir ~/.config/sway
ln -sf $PWD/i3/config ~/.config/sway/config
ln -sf $PWD/i3/i3blocks.conf ~/.config/sway/i3blocks.conf
mkdir ~/.config/sway/scripts
ln -sf $PWD/i3/scripts/volume ~/.config/sway/scripts/volume
