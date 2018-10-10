#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt-get install compton

ln -s $DIR/compton/compton.conf ~/.config/compton.conf
