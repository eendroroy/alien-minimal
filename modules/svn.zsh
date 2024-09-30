#!/usr/bin/env zsh

am_is_svn(){
  plib_is_svn
}

am_svn_rev(){
  echo -n "%B%F{$AM_REV_COLOR}$(plib_svn_rev)%f%b";
}

am_svn_symbol(){
  echo -ne "%F{$AM_VCS_COLOR}${AM_SVN_SYM}:%f"
}
