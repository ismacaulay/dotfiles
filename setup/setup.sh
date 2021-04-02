#!/bin/bash

DOTFILES_DIR=$HOME/workspaces/dotfiles

# setup git
git config --global user.name "Ian Macaulay"
git config --global user.email "ismacaul@gmail.com"
git config --global pull.rebase false
git config --global core.pager 'less -+F'

# setup configs
ln -s $DOTFILES_DIR/zsh/zshrc $HOME/.zshrc
ln -s $DOTFILES_DIR/starship.toml $HOME/.config/starship.toml
ln -s $DOTFILES_DIR/tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES_DIR/nvim $HOME/.config/nvim
ln -s $DOTFILES_DIR/vimrc $HOME/.vimrc

# install zsh plugin
mkdir $HOME/.zsh-plugins
git clone https://github.com/lukechilds/zsh-nvm.git $HOME/.zsh-plugins/zsh-nvm
git clone https://github.com/mroth/evalcache.git $HOME/.zsh-plugins/evalcache

