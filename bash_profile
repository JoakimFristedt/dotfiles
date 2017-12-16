# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Java
export JAVA_HOME="/usr/lib/jvm/default-java"
export PATH="$JAVA_HOME:$PATH"

# Maven
export M2_HOME="/opt/apache-maven-3.5.2"
export M2="$M2_HOME/bin"
export MAVEN_OPTS="-Xms1g -Xmx1g"
export PATH="$M2:$PATH"
