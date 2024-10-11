#!/usr/bin/env bash

TERM=${TERM:-"screen-256color"}

reset_color=$(tput sgr0)

announce() {
  printf "%s[+] %s%s\n" "$(tput setaf 6)" "$1" "$reset_color"
}

info() {
  printf "%s==> %s%s%s\n" "$(tput setaf 4)" "$(tput setaf 7)" "$1" "$reset_color"
}

success() {
  printf "%s[\xE2\x9C\x94] %s%s\n" "$(tput setaf 2)" "$1" "$reset_color"
}

err() {
  printf "%s[x] %s%s\n" "$(tput setaf 1)" "$1" "$reset_color"
}

warn() {
  printf "%s[!] %s%s\n" "$(tput setaf 3)" "$1" "$reset_color"
}
