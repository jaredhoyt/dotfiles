#!/usr/bin/env bash

install_package() {
  local name="$1"
  local package="$PACKAGES_DIR/$name"

  # Verify package exists
  if [ ! -d "$package" ]; then
    err "Unrecognized package: $name"
    exit 1
  fi

  announce "Installing $name..."

  # Install dependencies
  #
  # Bundles a package if a `Brewfile` is found in the package root.
  #
  # For example:
  #
  #   packages/acme/Brewfile
  #
  if [ -f "$package/Brewfile" ]; then
    brew::bundle "$package/Brewfile"
  fi

  # Setup dot-files
  #
  # Creates a symlink for any file prefixed with `dot-` found in the
  # package root and the user's home directory.
  #
  # For example:
  #
  #   packages/acme/dot-acmerc => ~/.acmerc
  #
  for dotfile in $(find "$package" -maxdepth 1 -name 'dot-*'); do
    symlink "$dotfile" "$HOME/.${dotfile#*dot-}"
  done

  # Setup XDG config(s)
  #
  # Creates a symlink between the `config` directory in the package root
  # and the XDG config home.
  #
  # For example:
  #
  #   packages/acme/config => ~/.config/acme
  #
  if [ -d "$package/config" ]; then
    symlink::config "$package/config" $name
  fi

  # Setup zsh plugin
  #
  # Creates a symlink between the `zsh` directory in the package root
  # and the zsh config home.
  #
  # For example:
  #
  #   packages/acme/zsh => ~/.config/zsh/plugins/acme
  #
  if [ -d "$package/zsh" ]; then
    symlink::zsh "$package/zsh" $name
  fi

  # Custom install script
  #
  # Runs a custom `install` script if one is found in the package root.
  #
  if [ -f "$package/install" ]; then
    . "$package/install"
  fi

  success "Installed package: $name"; echo
}

install_packages() {
  local packages=$*
  local reload_shell="false"

  # Install selected packages
  for name in $*; do
    install_package "$name"
  done

  # Reload shell if config changed
  if [[ $reload_shell == "true" ]]; then
    info "Reloading zsh..."
    exec "zsh"
  fi
}
