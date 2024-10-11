#!/usr/bin/env bash

# Bootstrap zshenv
source "$PACKAGES_DIR/zsh/dot-zshenv"

symlink::config() {
  # Ensure the XDG directory exists
  if [ ! -d "$XDG_CONFIG_HOME" ]; then
    mkdir "$XDG_CONFIG_HOME"
  fi

  symlink $1 "$XDG_CONFIG_HOME/$2"
}

symlink::zsh() {
  # Ensure zsh is setup already
  if [ ! -L "$HOME/.zshenv" ] ||  [ ! -d "$ZDOTDIR" ]; then
    install_package "zsh"
  fi

  symlink $1 "$ZDOTDIR/plugins/$2"

  # Reload the shell at the end
  #
  # TODO: Would be nice if this detected if a symlink actually
  # got created to avoid unnecessary shell reloads.
  reload_shell="true"
}

symlink () {
  local src=$1 dst=$2
  local overwrite= backup=

  # This symlink already exists
  if [ "$dst" -ef "$src" ]; then
    return
  fi

  # This file/directory already exists
  if [ -e "$dst" ]; then
    local action

    # TODO: I want this to just show the package/dir, not the full path
    warn "Path already exists ("$dst"): [o]verwrite, [b]ackup, [s]kip, or [e]xit?"
    read -n 1 action
    echo

    case "$action" in
      o )
        overwrite=true;;
      b )
        backup=true;;
      e )
        exit 1;;
      * )
        return;;
    esac
  fi

  if [ "$overwrite" == "true" ]; then
    rm -rf "$dst"
    info "-- removed $dst"
  fi

  if [ "$backup" == "true" ]; then
    mv "$dst" "${dst}.backup"
    info "-- moved $dst to ${dst}.backup"
  fi

  # Create symlink
  ln -s "$src" "$dst"
  info "-- symlink $src -> $dst"
}
