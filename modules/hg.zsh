#!/usr/bin/env zsh

am_is_hg(){
  echo -ne "$(plib_is_hg)"
}

am_hg_branch(){
  echo -ne "%B%F{$am_branch_color}$(plib_hg_branch)%f%b";
}

am_hg_rev(){
  echo -ne "%F{$am_rev_color}$(plib_hg_rev)%f";
}
