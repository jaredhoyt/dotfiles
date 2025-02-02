#!/usr/bin/env zsh

alias reload!="source $ZDOTDIR/.zshrc"

alias ..='cd ..'
alias cd..='cd ..'
alias cp='nocorrect cp'
alias l.='ls -ld .[^.]*'
alias la="ls -a"
alias ll="ls -l"
alias lsd='ls -ld *(-/DN)'
alias md='mkdir -p'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'       # no spelling correction on mv
alias rd='rmdir'
