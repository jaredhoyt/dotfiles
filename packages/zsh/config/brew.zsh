#!/usr/bin/env zsh

if [[ "$(uname)" == "Darwin" ]]; then
  if [[ "$(uname -m)" == "arm64" ]]; then
    # On ARM macOS, homebrew installs to /opt/homebrew
    HOMEBREW_PREFIX="/opt/homebrew"
  else
    # On Intel macOS, homebrew installs to /usr/local
    HOMEBREW_PREFIX="/usr/local"
  fi
else
  HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
fi

eval $(${HOMEBREW_PREFIX}/bin/brew shellenv)
