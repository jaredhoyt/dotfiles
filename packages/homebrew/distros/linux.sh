#!/usr/bin/env bash

# Debian/Ubuntu build tools
sudo apt-get install build-essential procps curl file git

info "Installing homebrew..."
sudo --validate # reset `sudo` timeout to use Homebrew install in noninteractive mode
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Setup brew in PATH
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc

source ~/.bashrc
