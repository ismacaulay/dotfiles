#!/bin/bash

DOTFILES_DIR=$HOME/workspaces/dotfiles

# setup git
git config --global user.name "Ian Macaulay"
git config --global user.email "ismacaul@gmail.com"
git config --global pull.rebase false
git config --global core.pager 'less -+F'

# setup zshrc
ln -s $DOTFILES_DIR/zsh/zshrc $HOME/.zshrc

# install zsh plugin
mkdir $HOME/.zsh-plugins
git clone https://github.com/lukechilds/zsh-nvm.git $HOME/.zsh-plugins/zsh-nvm
git clone https://github.com/mroth/evalcache.git $HOME/.zsh-plugins/evalcache

# setup starship
ln -s $DOTFILES_DIR/starship.toml $HOME/.config/starship.toml

exec /bin/zsh

ln -s $DOTFILES_DIR/tmux.conf $HOME/.tmux.conf

# install node for coc-vim; zsh-nvm will install nvim
nvm install --lts

ln -s $DOTFILES_DIR/nvim $HOME/.config/nvim
ln -s $DOTFILES_DIR/vimrc $HOME/.vimrc
