#!/usr/bin/env zsh

# chruby
[[ ! -e /opt/homebrew/opt/chruby/share/chruby/chruby.sh ]] || source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# [[ ! -e /opt/homebrew/opt/chruby/share/chruby/auto.sh ]] || source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# gem_home
[[ ! -e "$XDG_CONFIG_HOME/ruby/gem_home/gem_home.sh" ]] || source "$XDG_CONFIG_HOME/ruby/gem_home/gem_home.sh"
[[ ! -e "$XDG_CONFIG_HOME/ruby/gem_home/auto.sh" ]] || source "$XDG_CONFIG_HOME/ruby/gem_home/auto.sh"
