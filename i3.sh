#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.i3/scripts
ln -s $DIR/i3/config ~/.i3/config
ln -s $DIR/i3/i3blocks.conf ~/.i3/i3blocks.conf
ln -s $DIR/i3/scripts/volume ~/.i3/scripts/volume
ln -s $DIR/i3/scripts/display ~/.i3/scripts/display
