#!/usr/bin/env bash

# Xcode is a prerequisite
package::install "xcode"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

info "Installing homebrew..."
sudo --validate # reset `sudo` timeout to use Homebrew install in noninteractive mode
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
