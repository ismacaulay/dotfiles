#!/bin/bash
# tools and shell
yay -S pkgconf xclip zsh neovim fzf nodejs ripgrep tmux

yay -S --needed base-devel openssl zlib bzip2 readline sqlite curl \
    llvm ncurses xz tk libffi python-pyopenssl git ncurses5-compat-libs
