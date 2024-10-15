#!/usr/bin/env zsh

typeset -U plugins

IFS=$'\n'
plugins=($(find -L "$ZDOTDIR/plugins" -name "*.zsh" | sort))
unset IFS

# load the path files
for file in ${(M)plugins:#*/path.zsh}; do
  source $file
done

# load everything but the path and completion files
for file in ${${plugins:#*/path.zsh}:#*/completion.zsh}; do
  source $file
done

# load every completion after autocomplete loads
for file in ${(M)plugins:#*/completion.zsh}; do
  source $file
done

unset plugins
