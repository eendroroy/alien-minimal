#!/usr/bin/env zsh

am_ruby_version(){
  echo -ne "%F{$am_ruby_color}${AM_RB_SYM}`plib_ruby_short_version`%f"
}

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
  echo -ne "%F{$am_python_color}${AM_PY_SYM}`plib_python_major_minor_version`%f"
}

am_java_version(){
  echo -ne "%F{$am_java_color}${AM_JAVA_SYM}`plib_java_major_version`%f"
}
