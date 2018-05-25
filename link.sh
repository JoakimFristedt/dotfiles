#!/bin/bash

ln -s $PWD/bash/inputrc ~/.inputrc
ln -s $PWD/bash/bash_aliases ~/.bash_aliases
ln -s $PWD/bash/bash_profile ~/.bash_profile
ln -fs $PWD/bash/bashrc ~/.bashrc

ln -s $PWD/tmux/tmux.conf ~/.tmux.conf

mkdir -p ~/.vim/{undos,swap,backups}
ln -s $PWD/vim/vimrc ~/.vimrc
ln -s $PWD/vim/ideavimrc ~/.ideavimrc

ln -s $PWD/git/gitignore ~/.gitignore
ln -s $PWD/git/gitconfig ~/.gitconfig
