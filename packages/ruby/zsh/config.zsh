#!/usr/bin/env zsh

# chruby
[[ ! -e /usr/local/opt/chruby/share/chruby/chruby.sh ]] || source /usr/local/opt/chruby/share/chruby/chruby.sh
[[ ! -e /usr/local/opt/chruby/share/chruby/auto.sh ]] || source /usr/local/opt/chruby/share/chruby/auto.sh

# gem_home
[[ ! -e "$XDG_CONFIG_HOME/ruby/gem_home/gem_home.sh" ]] || source "$XDG_CONFIG_HOME/ruby/gem_home/gem_home.sh"
[[ ! -e "$XDG_CONFIG_HOME/ruby/gem_home/auto.sh" ]] || source "$XDG_CONFIG_HOME/ruby/gem_home/auto.sh"
