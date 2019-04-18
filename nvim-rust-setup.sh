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

# Create nvim config to load plugins and setup rls
mkdir -p ~/.config/nvim

echo "
\" vimplug loading
call plug#begin('~/.local/share/nvim/site/plugged')

\" RLS and async autocomplete plugins
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

\" RLS setup, source: https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Rust
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif
" > ~/.config/nvim/init.vim

# Reminder to run :PlugInstall in nvim, to complete installation
echo "Run :PlugInstall when you launch nvim for the first time to complete plugin setup"
