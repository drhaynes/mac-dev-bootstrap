#!/bin/bash

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# Install Espanso text expansion
brew install espanso
cp -r ./espanso/* /Users/$(whoami)/Library/Preferences/epanso

