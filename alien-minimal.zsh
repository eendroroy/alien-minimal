#!/usr/bin/env zsh

# shellcheck disable=SC2034
# shellcheck disable=SC2088

if [[ -f ~/.amrc ]]; then
  source ~/.amrc
else
  echo
  print -P "%F{red}    ===> '~/.amrc' file not found, creating dummy '~/.amrc' file ... %f"
  echo
  cp "${0:A:h}/amrc.zsh" ~/.amrc
fi

THEME_ROOT=${0:A:h}

source "${THEME_ROOT}/libs/promptlib/activate"
source "${THEME_ROOT}/libs/zsh-async/async.zsh"

source "${THEME_ROOT}/modules/init.zsh"
source "${THEME_ROOT}/modules/symbols.zsh"
source "${THEME_ROOT}/modules/sections_general.zsh"
source "${THEME_ROOT}/modules/sections_vcs.zsh"
source "${THEME_ROOT}/modules/sections_version.zsh"
source "${THEME_ROOT}/modules/prompt.zsh"

function precmd(){
  autoload -U add-zsh-hook
  setopt prompt_subst
  am_load_theme
  __import_env

  if [[ ${AM_ASYNC_L_PROMPT} == 1 ]]; then
    am_async_l_prompt "${PWD}"
  else
    PROMPT="$(am_l_prompt_render)"
  fi

  [[ ${AM_KEEP_PROMPT} != 1 ]] && RPROMPT=""
  am_async_r_prompt
}
