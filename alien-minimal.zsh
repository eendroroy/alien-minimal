#!/usr/bin/env zsh

THEME_ROOT=${0:A:h}

source "${THEME_ROOT}/libs/promptlib/activate"
source "${THEME_ROOT}/libs/zsh-async/async.zsh"
source "${THEME_ROOT}/libs/zsh-256color/zsh-256color.plugin.zsh"

source "${THEME_ROOT}/modules/colors.zsh"

source "${THEME_ROOT}/modules/git.zsh"
source "${THEME_ROOT}/modules/hg.zsh"
source "${THEME_ROOT}/modules/svn.zsh"
source "${THEME_ROOT}/modules/ssh.zsh"
source "${THEME_ROOT}/modules/bgjob.zsh"
source "${THEME_ROOT}/modules/async.zsh"
source "${THEME_ROOT}/modules/python.zsh"

if [[ -z "${PROMPT_START_TAG}" ]]
then
  PROMPT_START_TAG=''
fi

if [[ -z "${PROMPT_END_TAG}" ]]
then
  PROMPT_END_TAG=''
fi

if [[ -z "${PROMPT_START_TAG_COLOR}" ]]
then
  PROMPT_START_TAG_COLOR=81
fi

if [[ -z "${PROMPT_END_TAG_COLOR}" ]]
then
  PROMPT_END_TAG_COLOR=81
fi

function precmd(){
  autoload -U add-zsh-hook
  setopt prompt_subst
  am_load_colors
  start_tag="%F{$PROMPT_START_TAG_COLOR}${PROMPT_START_TAG}%f"
  end_tag="%F{$PROMPT_END_TAG_COLOR}${PROMPT_END_TAG}%f"
  PROMPT='`am_ssh_st``am_venv`${start_tag}%(?.%F{$am_normal_color}%1~%f${end_tag}.%F{$am_error_color}%B%1~%b%f${end_tag} %F{$am_fade_color}%?%f) '
  RPROMPT=''
  am_async_r_prompt
}
