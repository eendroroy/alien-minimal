#!/usr/bin/env zsh


_is_hg(){
  if [[ $(hg branch 2>/dev/null) != "" ]]; then
    echo 1
  else
    echo 0
  fi
}

_hg_branch(){
  ref=$(hg branch 2> /dev/null) || return;
  echo -n "${ref}";
}

_hg_rev(){
  rev=$(hg identify --num | tr -d " +") || return;
  echo -n "${rev}";
}
