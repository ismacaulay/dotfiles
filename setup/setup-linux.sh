#!/bin/bash
DOTFILES_DIR=$HOME/workspaces/dotfiles

ln -s $DOTFILES_DIR/Xmodmap $HOME/.Xmodmap

# starship.rs
curl -fsSL https://starship.rs/install.sh | bash

# vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# pyenv
curl https://pyenv.run | bash
