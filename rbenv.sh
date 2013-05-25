#!/bin/bash

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

load_rbenv () {
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
}

install_rbenv() {
  git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  git clone https://github.com/ianheggie/rbenv-binstubs.git ~/.rbenv/plugins/rbenv-binstubs

  load_rbenv

  curl https://raw.github.com/gist/4637375/rbenv.sh | sh ; rbenv global 1.9.3-p392-railsexpress
  rbenv rehash
  gem install bundler
  rbenv rehash
}

if [ -e ~/.rbenv ]; then
  success "[rbenv] installed. ($(rbenv -v))"
else
  info "[rbenv] installing.."
  install_rbenv
  success "[rbenv] done. ($(rbenv -v))"
fi;

exec $SHELL -l
