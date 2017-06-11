#!/usr/bin/env zsh

am_is_git(){
  echo -ne `plib_is_git`
}

am_git_branch(){
  echo -ne "%B%F{$am_branch_color}`plib_git_branch`%f%b";
}

am_git_rev(){
  echo -n "%F{$am_rev_color}`plib_git_rev`%f";
}

am_git_dirty(){
  echo -n "%F{$am_dirty_color}`plib_git_dirty`%f";
}

am_git_left_right(){
  echo -n "%F{$am_left_right_color}`plib_git_left_right`%f";
}

am_git_commit_time(){
    echo -n "%F{$am_commit_since_color}[`plib_git_commit_since`]%f"
}
