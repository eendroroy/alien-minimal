#!/usr/bin/env zsh


cp_is_svn(){
  if [[ $(svn info 2>/dev/null) != "" ]]; then
    echo 1
  else
    echo 0
  fi
 }

cp_svn_rev(){
  rev=$(svn info 2>/dev/null | grep Revision | awk '{print $2}') || return;
  echo -n "%B%F{$clean_rev_color}${rev}%f%b";
}
