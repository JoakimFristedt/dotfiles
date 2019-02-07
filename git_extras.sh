#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

base_url="https://raw.githubusercontent.com/git/git/master/contrib/completion"
completion="git-completion.bash"
prompt="git-prompt.sh"

_install() {
  wget --quiet -nc -P $DIR/git $base_url/$1
  ln -fs $DIR/git/$1 ~/.$1
}

_install $prompt
_install $completion
