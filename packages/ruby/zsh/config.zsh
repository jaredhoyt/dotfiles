#!/usr/bin/env zsh

# chruby!
[[ ! -a /usr/local/opt/chruby/share/chruby/chruby.sh ]] || source /usr/local/opt/chruby/share/chruby/chruby.sh
[[ ! -a /usr/local/opt/chruby/share/chruby/auto.sh ]] || source /usr/local/opt/chruby/share/chruby/auto.sh

# gem_home
[[ ! -a /usr/local/share/gem_home/gem_home.sh ]] || source /usr/local/share/gem_home/gem_home.sh
[[ ! -a ~/.gem_home_auto ]] || source ~/.gem_home_auto
