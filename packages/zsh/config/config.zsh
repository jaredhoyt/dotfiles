#!/usr/bin/env zsh

# color term
export CLICOLOR=1
export LSCOLORS=Dxfxcxdxbxegedabadacad
export ZLS_COLORS=$LSCOLORS
export LC_CTYPE=en_US.UTF-8
export LESS=FRX

# make with the pretty colors
autoload colors; colors

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

setopt APPEND_HISTORY # adds history
setopt COMPLETE_IN_WORD
setopt CORRECT
setopt EXTENDED_HISTORY # add timestamps to history
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt PROMPT_SUBST
setopt SHARE_HISTORY # share history between sessions ???

# I want to use [ and ] damn it!
unsetopt nomatch

# Bindings

# emacs keybindings
bindkey -e

# use incremental search
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# external editor support
autoload edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Partial word history completion
bindkey '\ep' up-line-or-search
bindkey '\en' down-line-or-search
bindkey '\ew' kill-region

if command -v fzf 2>&1 >/dev/null; then
  source <(fzf --zsh)
fi

# set cd autocompletion to commonly visited directories
cdpath=(. ~ ~/src $WORKSPACE)
