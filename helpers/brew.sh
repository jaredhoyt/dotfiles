#!/usr/bin/env bash

brew::bundle() {
  local brewfile="$1"

  if [[ "$SKIP_BREW" == "true" ]]; then
    return
  fi

  if [[ ! $(which brew) ]]; then
    install_package "homebrew"
  fi

  info "Bundling $brewfile..."
  brew bundle --file="$brewfile"
}
