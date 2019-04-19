#!/bin/bash

# Setting up a new Mac for nvim / rust dev

# Install nvim and sdl2 libraries
brew install sdl2 nvim

# Install rustup
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

# Install rust components (language server (RLS), analytics and rust source code)
rustup component add rls rust-analysis rust-src

# Install vim-plug plugin manager for nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy our (very opinionated) nvim configuration into place
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/

# Reminder to run :PlugInstall in nvim, to complete installation
echo "Run :PlugInstall when you launch nvim for the first time to complete plugin setup"

