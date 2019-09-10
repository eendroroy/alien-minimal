#!/usr/bin/env zsh

am_is_hg(){
  echo -ne "$(plib_is_hg)"
}

am_hg_branch(){
  echo -ne "%B%F{$AM_BRANCH_COLOR}$(plib_hg_branch)%f%b";
}

am_hg_rev(){
  echo -ne "%F{$AM_REV_COLOR}$(plib_hg_rev)%f";
}
