#!/usr/bin/env zsh


cp_is_hg(){
  if [[ $(hg branch 2>/dev/null) != "" ]]; then
    echo 1
  else
    echo 0
  fi
}

cp_hg_branch(){
  ref=$(hg branch 2> /dev/null) || return;
  echo -n "%B%F{$clean_branch_color}${ref}%f%b";
}

cp_hg_rev(){
  rev=$(hg identify --num | tr -d " +") || return;
  echo -n "%F{$clean_rev_color}${rev}%f";
}
