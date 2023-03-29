#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"' >> ~/.zprofile
eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"

./install-homebrew-packages.sh
./install-homebrew-casks.sh

./macos-tweaks.sh

./nvim-rust-setup.sh

./opinionated-bootstrap.sh
