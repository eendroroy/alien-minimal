#!/usr/bin/env zsh

CLEAN_ROOT=${0:A:h}

source "${CLEAN_ROOT}/libs/zsh-async/async.zsh"
source "${CLEAN_ROOT}/libs/zsh-256color/zsh-256color.plugin.zsh"

source "${CLEAN_ROOT}/modules/colors.zsh"

source "${CLEAN_ROOT}/modules/git.zsh"
source "${CLEAN_ROOT}/modules/hg.zsh"
source "${CLEAN_ROOT}/modules/svn.zsh"
source "${CLEAN_ROOT}/modules/ssh.zsh"
source "${CLEAN_ROOT}/modules/bgjob.zsh"
source "${CLEAN_ROOT}/modules/async.zsh"

function precmd(){
  autoload -U add-zsh-hook
  setopt prompt_subst
  PROMPT='`cp_ssh_st`%(?.%F{$clean_normal_color}%1~%f.%F{$clean_error_color}%B%1~%b%f %F{$clean_fade_color}%?%f) '
  RPROMPT=''
  cp_async_r_prompt
}
