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
source "${THEME_ROOT}/libs/zsh-256color/zsh-256color.plugin.zsh"

source "${THEME_ROOT}/modules/symbols.zsh"
source "${THEME_ROOT}/modules/theme.zsh"

source "${THEME_ROOT}/modules/git.zsh"
source "${THEME_ROOT}/modules/hg.zsh"
source "${THEME_ROOT}/modules/svn.zsh"
source "${THEME_ROOT}/modules/ssh.zsh"
source "${THEME_ROOT}/modules/async.zsh"
source "${THEME_ROOT}/modules/versions.zsh"

source "${THEME_ROOT}/modules/sections.zsh"
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
