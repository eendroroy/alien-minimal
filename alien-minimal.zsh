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

source "${THEME_ROOT}/modules/init.zsh"

source "${THEME_ROOT}/libs/promptlib/activate"
source "${THEME_ROOT}/libs/zsh-async/async.zsh"
source "${THEME_ROOT}/libs/zsh-256color/zsh-256color.plugin.zsh"

source "${THEME_ROOT}/modules/theme.zsh"
source "${THEME_ROOT}/modules/prompt.zsh"

source "${THEME_ROOT}/modules/git.zsh"
source "${THEME_ROOT}/modules/hg.zsh"
source "${THEME_ROOT}/modules/svn.zsh"
source "${THEME_ROOT}/modules/ssh.zsh"
source "${THEME_ROOT}/modules/async.zsh"
source "${THEME_ROOT}/modules/versions.zsh"

[[ ${AM_ENABLE_VI_PROMPT} == 1 ]] && source "${THEME_ROOT}/modules/viprompt.zsh"

function precmd(){
  autoload -U add-zsh-hook
  setopt prompt_subst
  am_load_theme
  [[ ${AM_ENABLE_VI_PROMPT} == 1 ]] && am_render_vi_mode

  if [[ ${AM_ASYNC_L_PROMPT} == 1 ]]; then
    am_async_l_prompt
  else
    __AM_ENVS="$(env | grep --color=never "ENV_VERSION=\|^VIRTUAL_ENV=\|^AM_")"
    PROMPT="$(am_l_prompt_render "${PWD}" "${__AM_ENVS}")"
    PROMPT="$(echo "${PROMPT}" | tr -s ' ')"
  fi

  [[ ${AM_KEEP_PROMPT} != 1 ]] && RPROMPT=""

  am_async_r_prompt
}
