#!/usr/bin/env zsh

am_venv(){
  if [[ -n "${VIRTUAL_ENV}" ]]; then
    __venv="(`basename \"$VIRTUAL_ENV\"`)"
    echo -ne "%F{$am_venv_color}${__venv}%f "
    unset __venv
  fi
}