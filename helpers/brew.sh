#!/usr/bin/env bash

brew::bundle() {
  local brewfile="$1"

  if [[ ! $(which brew) ]]; then
    install_package "homebrew"
  fi

  info "Bundling $brewfile..."
  brew bundle --file="$brewfile"
}
