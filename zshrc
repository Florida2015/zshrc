# @author     Sebastian Tramp <mail@sebastian.tramp.name>
# @license    http://opensource.org/licenses/gpl-license.php
#
# the main RC file (will be linked to ~/.zshrc)
#

# first include of the environment
source $HOME/.config/zsh/environment.zsh

typeset -ga sources
sources+="$ZSH_CONFIG/environment.zsh"
sources+="$ZSH_CONFIG/options.zsh"
sources+="$ZSH_CONFIG/prompt.zsh"
sources+="$ZSH_CONFIG/functions.zsh"
sources+="$ZSH_CONFIG/aliases.zsh"

# highlights the live command line
# Cloned From: git://github.com/nicoulaj/zsh-syntax-highlighting.git
sources+="$ZSH_CONFIG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# provides the package name of a non existing executable
# (sudo apt-get install command-not-found)
sources+="/etc/zsh_command_not_found"

# Check for a system specific file
systemFile=`uname -s | tr "[:upper:]" "[:lower:]"`
sources+="$ZSH_CONFIG/$systemFile.zsh"

# Private aliases and adoptions
sources+="$ZSH_CONFIG/private.zsh"

# completion config needs to be after system and private config
sources+="$ZSH_CONFIG/completion.zsh"

# fasd integration and config
sources+="$ZSH_CONFIG/fasd.zsh"

# Private aliases and adoptions added at the very end (e.g. to start byuobu)
sources+="$ZSH_CONFIG/private.final.zsh"

sources+="$ZSH_CONFIG/mine.zsh"

# try to include all sources
foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end

export EDITOR=vim
export GOPATH=/home/shenhd/workspace/go
export TERM=xterm-256color

export ZOOKEEPER_HOME=/opt/zookeeper
export SCALA_HOME=/opt/scala
export SBT_HOME=/opt/sbt
export KAFKA_HOME=/opt/kafka
export SPARK_HOME=/opt/spark
export JSTORM_HOME=/opt/jstorm
export PATH="$PATH:$ZOOKEEPER_HOME/bin:$SCALA_HOME/bin:$SBT_HOME/bin:$KAFKA_HOME/bin:$SPARK_HOME/bin:$JSTORM_HOME/bin"

# alias
alias ls="ls --color=auto"
alias ll="ls -hl"
export EDITOR=vim

echo
echo "=============== Quote Of The Day ==============="
fortune
echo "================================================"
echo
