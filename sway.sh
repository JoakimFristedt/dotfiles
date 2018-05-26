#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.config/sway/scripts
ln -sf $DIR/i3/config ~/.config/sway/config
ln -sf $DIR/i3/i3blocks.conf ~/.config/sway/i3blocks.conf
ln -sf $DIR/i3/scripts/volume ~/.config/sway/scripts/volume
