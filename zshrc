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

# Add path to the front of PATH, removing its previous occurrence if necessary
pathadd() {
    if [ -d "$1" ]; then
	local P=`echo $1 | sed 's_/_\\\/_g'`
	PATH=$1:`echo $PATH | awk -v RS=: -v ORS=: "/$P/ {next} {print}" | sed 's/:$//'`
    fi
}

# Put /usr/local/bin ahead of /usr/bin
pathadd /usr/local/bin

# Use rbenv
pathadd $HOME/.rbenv/bin
pathadd $HOME/.rbenv/shims
eval "$(rbenv init -)"

# Add Haskell binaries to PATH
pathadd $HOME/Library/Haskell/bin
pathadd $HOME/.cabal/bin

# Add the Heroku Toolbelt to PATH
pathadd /usr/local/heroku/bin
