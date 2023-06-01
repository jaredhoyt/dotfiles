#!/usr/bin/env zsh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

BREW_COMMAND=$(which brew)

# Check for Homebrew
if test ! $(which brew)
then
  sudo xcodebuild -license
  xcode-select -p
  if [[ "$?" -eq "2" ]]; then
    sudo xcode-select --install
    echo ""
    echo "Please install 'Command Line Tools for Xcode' (follow instructions on window prompt)"
    echo ""
    echo "Press any key to continue…"
    read
  fi
  echo "  Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

${BREW_COMMAND} bundle --file=$HOME/.dotfiles/homebrew/Brewfile install

touch "${HOME}/.tmux.conf.local"

exit 0
