#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

URL="https://raw.githubusercontent.com/Bash-it/bash-it/master/completion/available"
COMPLETIONS=("tmux.completion.bash" "maven.completion.bash" "ssh.completion.bash" "git.completion.bash")

DIR="completion/bash_completion.d"
COMPLETION_DIR="~/.bash_completion.d"

if [ ! -d $DIR ]; then
    mkdir $DIR
fi

for file in "${COMPLETIONS[@]}" ; do
    wget -O $DIR/$file $URL/$file
done

ln -sf $SCRIPT_DIR/completion/bash_completion ~/.bash_completion


if [ ! -d "~/.bash_completion.d" ]; then
    mkdir $COMPLETION_DIR
fi

ln -sf $SCRIPT_DIR/completion/bash_completion.d/* ~/.bash_completion.d/
