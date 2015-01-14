unset GEM_HOME_AUTO

if [ -z "$GEM_HOME_FILENAME" ]; then
  export GEM_HOME_FILENAME="Gemfile"
fi

function gem_home_auto() {
  local dir="$PWD/"

  until [[ -z "$dir" ]]
  do
    dir="${dir%/*}"

    if [ -f "$dir/$GEM_HOME_FILENAME" ]; then
      if [[ -n $GEM_HOME_AUTO ]] && [[ $GEM_HOME_AUTO != "$dir" ]]; then
        unset GEM_HOME_AUTO
        gem_home -
      fi

      if [[ -z $GEM_HOME_AUTO ]]; then
        GEM_HOME_AUTO="$dir"
        gem_home "$dir"
      fi

      return $?
    fi
  done

  if [[ -n $GEM_HOME_AUTO ]]; then
    unset GEM_HOME_AUTO
    gem_home -
  fi
}

if [[ -n "$ZSH_VERSION" ]]; then
  if [[ ! "$preexec_functions" == *gem_home_auto* ]]; then
    preexec_functions+=("gem_home_auto")
  fi
elif [[ -n "$BASH_VERSION" ]]; then
  trap '[[ "$BASH_COMMAND" != "$PROMPT_COMMAND" ]] && gem_home_auto' DEBUG
fi
