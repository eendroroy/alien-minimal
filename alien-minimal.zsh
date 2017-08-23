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
source "${THEME_ROOT}/modules/ruby.zsh"
source "${THEME_ROOT}/modules/java.zsh"
source "${THEME_ROOT}/modules/config.zsh"
source "${THEME_ROOT}/modules/timer.zsh"

configure

function prompt_general(){
  start_tag="%F{$PROMPT_START_TAG_COLOR}${PROMPT_START_TAG}%f"
  end_tag="%F{$PROMPT_END_TAG_COLOR}${PROMPT_END_TAG}%f"
  echo -ne "${start_tag}%(?.%F{$am_normal_color}%1~%f${end_tag}.%F{$am_error_color}%B%1~%b%f${end_tag} %F{$am_fade_color}%?%f)"
}

function preexec(){
  am_preexec_executed=1
  am_timer_start
}

function precmd(){
  autoload -U add-zsh-hook
  setopt prompt_subst
  am_load_colors
  __time="`am_get_time_prompt`"
  am_preexec_executed=0
  PROMPT='`am_ssh_st`$__time`am_venv` `prompt_general` '
  RPROMPT=''
  am_async_r_prompt
  am_timer_start
}
