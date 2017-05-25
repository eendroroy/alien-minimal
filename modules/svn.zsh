#!/usr/bin/env zsh


_is_svn(){
  if [[ $(svn info 2>/dev/null) != "" ]]; then
    echo 1
  else
    echo 0
  fi
 }

_svn_rev(){
  rev=$(svn info 2>/dev/null | grep Revision | awk '{print $2}') || return;
  echo -n "${rev}";
}
