#!/usr/bin/env zsh

THEME_ROOT=${0:A:h}

source "${THEME_ROOT}/libs/promptlib/activate.zsh"

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

function precmd(){
  autoload -U add-zsh-hook
  setopt prompt_subst
  am_load_colors
  PROMPT='`am_ssh_st``am_venv`%(?.%F{$am_normal_color}%1~%f.%F{$am_error_color}%B%1~%b%f %F{$am_fade_color}%?%f) '
  RPROMPT=''
  am_async_r_prompt
}
