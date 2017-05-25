#!/usr/bin/env zsh


am_is_hg(){
  if [[ $(hg branch 2>/dev/null) != "" ]]; then
    echo 1
  else
    echo 0
  fi
}

am_hg_branch(){
  ref=$(hg branch 2> /dev/null) || return;
  echo -n "%B%F{$clean_branch_color}${ref}%f%b";
}

am_hg_rev(){
  rev=$(hg identify --num | tr -d " +") || return;
  echo -n "%F{$clean_rev_color}${rev}%f";
}
