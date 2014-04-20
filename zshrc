# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

for function in ~/.zsh/functions/*; do
  source $function
done

# automatically enter directories without cd
setopt auto_cd

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# automatically pushd
setopt auto_pushd
export DIRSTACKSIZE=10

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Enable extended globbing
setopt EXTENDED_GLOB

# Use nvm
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
       	PATH="$1:$PATH"
    fi
}

# Put /usr/local/bin ahead of /usr/bin
export PATH=`echo $PATH | awk -v RS=: -v ORS=: '/\/usr\/local\/bin/ {next} {print}' | sed 's/:$//'`
pathadd /usr/local/bin

# Use rbenv
pathadd $HOME/.rbenv/bin
eval "$(rbenv init -)"

# Add Haskell binaries to PATH
pathadd $HOME/Library/Haskell/bin
pathadd $HOME/.cabal/bin
