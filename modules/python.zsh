#!/usr/bin/env zsh

am_venv(){
  echo -ne "%F{$am_venv_color}`plib_venv`%f "
}

am_python_version(){
  echo -ne "%F{$am_python_color}`plib_python_version`%f"
}

am_python_major_version(){
  echo -ne "%F{$am_python_color}`plib_python_major_version`%f"
}
