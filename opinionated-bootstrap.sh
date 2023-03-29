#!/bin/bash

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Espanso text expansion
brew install espanso
espanso service register
cp -r ./espanso/* ~/Library/Application\ Support/espanso
espanso service restart

echo "Remember to install Zenburn.terminal theme in Terminal.app"
