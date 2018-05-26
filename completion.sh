#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

URL="https://raw.githubusercontent.com/Bash-it/bash-it/master/completion/available"
COMPLETIONS=("tmux.completion.bash" "maven.completion.bash" "ssh.completion.bash")

DIR="completion/bash_completion.d"

mkdir $DIR

for file in "${COMPLETIONS[@]}" ; do
    wget -O $DIR/$file $URL/$file
done

ln -s $DIR/completion/bash_completion ~/.bash_completion
mkdir ~/.bash_completion.d
ln -s $DIR/completion/bash_completion.d/* ~/.bash_completion.d/
