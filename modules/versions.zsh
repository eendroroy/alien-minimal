#!/usr/bin/env zsh

# shellcheck disable=SC2154

am_venv(){
  echo -ne "%F{$AM_VENV_COLOR}$(plib_venv)%f"
}

am_python_version(){
  echo -ne "%F{$AM_PYTHON_COLOR}${AM_PY_SYM}$(plib_python_version)%f"
}

am_python_short_version(){
  echo -ne "%F{$AM_PYTHON_COLOR}${AM_PY_SYM}$(plib_python_major_minor_version)%f"
}

am_ruby_version(){
  echo -ne "%F{$AM_RUBY_COLOR}${AM_RB_SYM}$(plib_ruby_version)%f"
}

am_ruby_short_version(){
  echo -ne "%F{$AM_RUBY_COLOR}${AM_RB_SYM}$(plib_ruby_major_minor_version)%f"
}

am_java_version(){
  echo -ne "%F{$AM_JAVA_COLOR}${AM_JAVA_SYM}$(plib_java_version)%f"
}

am_java_short_version(){
  echo -ne "%F{$AM_JAVA_COLOR}${AM_JAVA_SYM}$(plib_java_major_version)%f"
}

am_go_version(){
  echo -ne "%F{$AM_GO_COLOR}${AM_GO_SYM}$(plib_go_version)%f"
}

am_go_short_version(){
  echo -ne "%F{$AM_GO_COLOR}${AM_GO_SYM}$(plib_go_major_minor_version)%f"
}

am_elixir_version(){
  echo -ne "%F{$AM_ELIXIR_COLOR}${AM_ELIXIR_SYM}$(plib_elixir_version)%f"
}

am_elixir_short_version(){
  echo -ne "%F{$AM_ELIXIR_COLOR}${AM_ELIXIR_SYM}$(plib_elixir_major_minor_version)%f"
}

am_crystal_version(){
  echo -ne "%F{$AM_CRYSTAL_COLOR}${AM_CRYSTAL_SYM}$(plib_crystal_version)%f"
}

am_crystal_short_version(){
  echo -ne "%F{$AM_CRYSTAL_COLOR}${AM_CRYSTAL_SYM}$(plib_crystal_major_minor_version)%f"
}

am_node_version(){
  echo -ne "%F{$AM_NODE_COLOR}${AM_NODE_SYM}$(plib_node_version)%f"
}

am_node_short_version(){
  echo -ne "%F{$AM_NODE_COLOR}${AM_NODE_SYM}$(plib_node_major_minor_version)%f"
}

am_php_version(){
  echo -ne "%F{$AM_PHP_COLOR}${AM_PHP_SYM}$(plib_php_version)%f"
}

am_php_short_version(){
  echo -ne "%F{$AM_PHP_COLOR}${AM_PHP_SYM}$(plib_php_major_minor_version)%f"
}

am_gradle_version(){
  echo -ne "%F{$AM_GRADLE_COLOR}${AM_GRADLE_SYM}$(plib_gradle_version)%f"
}

am_maven_version(){
  echo -ne "%F{$AM_MAVEN_COLOR}${AM_MAVEN_SYM}$(plib_maven_version)%f"
}
