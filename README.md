Hong's Dotfiles
===============

Overview
--------

This dotfiles repo is a fork of [thoughtbot's
dotfiles](https://github.com/thoughtbot/dotfiles).

I chose to base my dotfiles on that of thoughtbot's b/c of the following reasons:

* It can be used across all Unix-like environments (Not OSX dependent).
* It assumes you use terminal vim (Not a GUI editor like macvim).
* It only includes essential configurations and plugins (Unlike
  [yadr](https://github.com/skwp/dotfiles) which my previous dotfiles where
based on)

Installation
------------

Clone this repo to any machine you intend to work (including remote machines).
    git clone git://github.com/Hong-Kim/dotfiles.git

Then run the installation script:
    cd dotfiles
    ./install.sh

This will create dotfile symlinks in your HOME directory, git clone vundle to
the .vim/bundle/vundle directory, and use vundle to install all vim plugins.

Zsh is assumed (i.e. all shell configuration is done in `~/.zshrc`). Thus,
switch to it, if not already:
    chsh -s /bin/zsh

If you do not have zsh installed, you must install it first using `brew` or
`apt-get` depending on your OS. This is also true for tmux and vim. If you are on
a linux machine and vim complains you do not have a ruby-supported version of
vim, you should install vim-nox.

Personal Settings
-----------------

Explanations for some of my personal settings:

* emacs-keybindings on the command line: Vim's modal editing is great, but not
  when you are editing on the command line. You have no indication of whether
  you are in insert-mode or normal-mode, which leads to many typos. As a previous
  emacs user, emacs-keybindings are enough for my simple editing needs on the
  command line.
* `Ctrl+t` as my tmux prefix: `Ctrl+a` is used for
  beginning-of-line cursor movement. So instead, I use `Ctrl+t` (t is a mnemonic
  for tmux)
* rbenv: I use rbenv. Running `~/.rbenv.sh` will install rbenv and the ruby
  version 1.9.3-p392-railsexpress (originally written by
  [crpdm](https://github.com/crpdm).
* pretty git logging: Borrowed from Gary Bernhardt's
  [.githelpers](https://github.com/garybernhardt/dotfiles/blob/master/.githelpers).

Settings/ideas stolen from [yadr](https://github.com/skwp/dotfiles) (almost
everything in the `~/.vim/plugin/settings` directory):

* solarized-dark colorscheme: I prefer it over the `github` colorscheme (used by
  thoughtbot). Download and apply the [solarized-dark iTerm2
theme](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized).
* convenient keybindings: See the `~/.vim/plugin/settings/keymap.vim` file.

Additional vim plugins used (see the `.vimrc.bundles` file for a complete list):

* [lusty-explorer](http://www.vim.org/scripts/script.php?script_id=1890): I use
  ctrlp most of the time, but still need a decent file/directory navigator once
  in a while, and the `:e` command doesn't cut it.
* vim-unimpared: I use it for the `[+<space>`, `]+<space>` commands that add
  blank lines above and below the current line.
