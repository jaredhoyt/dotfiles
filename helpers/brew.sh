#!/usr/bin/env bash

brew::bundle() {
  local brewfile="$1"

  if [[ "$SKIP_BREW" == "true" ]]; then
    return
  fi

  if [[ ! $(which brew) ]]; then
    package::install "homebrew"
  fi

  info "Bundling $brewfile..."
  brew bundle --file="$brewfile"
}
