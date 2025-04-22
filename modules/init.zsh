#!/usr/bin/env zsh

__import_env() {
  env | grep --color=never "ENV_VERSION=\|^VIRTUAL_ENV=\|^AM_" | while IFS='\n' read -r line; do
    eval "export $(echo "${line}" | awk -F'=' '{print $1"=\""$2"\""}')" > /dev/null
  done
}

THEME_DIR="${0:A:h}/themes"

am_load_theme(){
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
      printf "\n  ==> (WARN) Theme file at '%s' not found. Loading default ...\n" "$AM_CUSTOM_THEME_PATH"
      source "${THEME_DIR}/default.zsh"
    fi
  fi
  am_theme
}

[[ -z "${AM_DIR_EXPANSION_LEVEL}" ]] && AM_DIR_EXPANSION_LEVEL=1
[[ -z "${AM_VI_PROMPT_VAL}" ]]       && AM_VI_PROMPT_VAL=""