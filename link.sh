#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $DIR/bash/inputrc ~/.inputrc
ln -s $DIR/bash/bash_aliases ~/.bash_aliases
ln -s $DIR/bash/bash_profile ~/.bash_profile
ln -fs $DIR/bash/bashrc ~/.bashrc

ln -s $DIR/tmux/tmux.conf ~/.tmux.conf

mkdir -p ~/.vim/{undos,swap,backups}
ln -s $DIR/vim/vimrc ~/.vimrc
ln -s $DIR/vim/ideavimrc ~/.ideavimrc

ln -s $DIR/git/gitignore ~/.gitignore
ln -s $DIR/git/gitconfig ~/.gitconfig
ln -s $DIR/git/git-prompt.sh ~/.git-prompt.sh
