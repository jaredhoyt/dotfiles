#!/usr/bin/env zsh

# all of our zsh files
typeset -U config_files

IFS=$'\n'
config_files=($(find -L "$ZDOTDIR" -name "*.zsh"))
unset IFS

# load the path files
for file in ${(M)config_files:#*/path.zsh}; do
  source $file
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}; do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit; compinit

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}; do
  source $file
done

unset config_files

# I want to use [ and ] damn it!
unsetopt nomatch

# set cd autocompletion to commonly visited directories
cdpath=(. ~ ~/src $WORKSPACE)

# rust, et al

# chruby!
[[ ! -a /usr/local/opt/chruby/share/chruby/chruby.sh ]] || source /usr/local/opt/chruby/share/chruby/chruby.sh
[[ ! -a /usr/local/opt/chruby/share/chruby/auto.sh ]] || source /usr/local/opt/chruby/share/chruby/auto.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# gem_home
[[ ! -a /usr/local/share/gem_home/gem_home.sh ]] || source /usr/local/share/gem_home/gem_home.sh
[[ ! -a ~/.gem_home_auto.sh ]] || source ~/.gem_home_auto.sh

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
# # Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
