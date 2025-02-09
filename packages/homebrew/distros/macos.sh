#!/usr/bin/env bash

# Ensure we have xcode tools for mac
if ! xcode-select -p >/dev/null; then
  xcode-select --install
  sudo xcodebuild -license accept
fi

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

info "Installing homebrew..."
sudo --validate # reset `sudo` timeout to use Homebrew install in noninteractive mode
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

source "$package/zsh/config.zsh"
