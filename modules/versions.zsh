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

am_go_version(){
  echo -ne "%F{$am_go_color}${AM_GO_SYM}`plib_go_version`%f"
}

am_crystal_version(){
  echo -ne "%F{$am_crystal_color}${AM_CRYSTAL_SYM}`plib_crystal_version`%f"
}

am_node_version(){
  echo -ne "%F{$am_node_color}${AM_NODE_SYM}`plib_node_major_version`%f"
}

am_php_version(){
  echo -ne "%F{$am_php_color}${AM_PHP_SYM}`plib_php_major_version`%f"
}
