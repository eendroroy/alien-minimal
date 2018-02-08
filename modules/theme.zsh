#!/usr/bin/env zsh

THEME_DIR="${0:A:h}/themes"

AM_load_theme(){
  if [[ -z "${AM_CUSTOM_THEME_PATH}" ]]; then
    if [[ -z "${AM_THEME}" ]]; then
      source "${THEME_DIR}/default.zsh"
    else
      source "${THEME_DIR}/${AM_THEME}.zsh"
    fi
  else
    if [[ -f "${AM_CUSTOM_THEME_PATH}" ]]; then
      source "${AM_CUSTOM_THEME_PATH}"
    else
      echo "\n  --> (WARN) theme ${AM_CUSTOM_THEME_PATH} not found. Loading default ..."
      source "${THEME_DIR}/default.zsh"
    fi
  fi
  am_theme
}
