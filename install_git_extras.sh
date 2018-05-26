#!/bin/bash

base_url="https://raw.githubusercontent.com/git/git/master/contrib/completion"
completion="git-completion.bash"
prompt="git-prompt.sh"

install() {
    wget --quiet -nc -P $PWD/git $base_url/$1
    ln -fs $PWD/git/$1 ~/.$1
}

install $prompt
install $completion
