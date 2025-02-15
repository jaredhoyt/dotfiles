#!/usr/bin/env zsh

mux() {
  local name cols
  if [ -n "$1" ]; then
    cd $1
  fi
  name="$(basename ${PWD} | sed -e 's/\./-/g')"

  mux_file="${PWD}/.mux"
  [ -f ${mux_file} ] || mux_file="${HOME}/.mux"

  if ! $(tmux has-session -t ${name} &>/dev/null); then
    cols="$(tput cols)"
    cd $1
    tmux new-session -d -n code -s ${name} -x${cols-150} -y50 'reattach-to-user-namespace -l zsh'
    echo "Creating tmux session for ${name}"
    name=${name} source ${mux_file}
  fi

  tmux attach-session -t ${name}
}
