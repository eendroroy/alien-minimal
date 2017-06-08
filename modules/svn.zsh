#!/usr/bin/env zsh


am_is_svn(){
  echo `plib_is_svn`
}

am_svn_rev(){
  echo -n "%B%F{$am_rev_color}`plib_svn_rev`%f%b";
}
