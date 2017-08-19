#!/usr/bin/env zsh

am_ssh_st(){
  __ssh_st="`plib_ssh_st`"
  if [[ "$__ssh_st" != "" ]]
	then
    echo -n " %F{$am_ssh_color}`plib_ssh_st`%f"
  else
    echo -ne ""
  fi
}
