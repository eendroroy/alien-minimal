#!/usr/bin/env zsh


am_is_hg(){
  echo -ne `plib_is_hg`
}

am_hg_branch(){
  echo -n "%B%F{$am_branch_color}`plib_hg_branch`%f%b";
}

am_hg_rev(){
  echo -n "%F{$am_rev_color}`plib_hg_rev`%f";
}
