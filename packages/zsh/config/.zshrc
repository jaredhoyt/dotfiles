#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/brew.zsh"
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/config.zsh"
source "$ZDOTDIR/fpath.zsh"
source "$ZDOTDIR/p10k.zsh"
source "$ZDOTDIR/plugins.zsh"
