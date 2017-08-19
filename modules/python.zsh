#!/usr/bin/env zsh

am_venv(){
  __venv="`plib_venv`"
  if [[ "$__venv" != "" ]]
	then
    echo -ne " %F{$am_venv_color}`plib_venv`%f"
  else
    echo -ne ""
  fi
}

am_python_version(){
  echo -ne "%F{$am_python_color}`plib_python_major_minor_version`%f"
}
