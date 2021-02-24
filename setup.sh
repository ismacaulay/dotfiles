#!/bin/bash

DOTFILES_DIR=$HOME/workspaces/dotfiles

git config --global user.name "Ian Macaulay"
git config --global user.email "ismacaul@gmail.com"
git config --global pull.rebase false

# setup zshrc
ln -s $DOTFILES_DIR/zsh/zshrc $HOME/.zshrc

# setup starship
ln -s $DOTFILES_DIR/starship.toml $HOME/.config/starship.toml

# install zsh-nvm plugin
git clone https://github.com/lukechilds/zsh-nvm.git $HOME/.zsh-nvm

exec /bin/zsh

ln -s $DOTFILES_DIR/Xmodmap $HOME/.Xmodmap
ln -s $DOTFILES_DIR/tmux.conf $HOME/.tmux.conf

# install node for coc-vim; zsh-nvm will install nvim
nvm install --lts

ln -s $DOTFILES_DIR/nvim $HOME/.config/nvim
ln -s $DOTFILES_DIR/vimrc $HOME/.vimrc
