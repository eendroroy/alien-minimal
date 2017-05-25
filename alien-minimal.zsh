#!/usr/bin/env zsh

THEME_ROOT=${0:A:h}

source "${THEME_ROOT}/libs/zsh-async/async.zsh"
source "${THEME_ROOT}/libs/zsh-256color/zsh-256color.plugin.zsh"

source "${THEME_ROOT}/modules/colors.zsh"

source "${THEME_ROOT}/modules/git.zsh"
source "${THEME_ROOT}/modules/hg.zsh"
source "${THEME_ROOT}/modules/svn.zsh"
source "${THEME_ROOT}/modules/ssh.zsh"
source "${THEME_ROOT}/modules/bgjob.zsh"
source "${THEME_ROOT}/modules/async.zsh"

function precmd(){
  autoload -U add-zsh-hook
  setopt prompt_subst
  PROMPT='`am_ssh_st`%(?.%F{$clean_normal_color}%1~%f.%F{$clean_error_color}%B%1~%b%f %F{$clean_fade_color}%?%f) '
  RPROMPT=''
  am_async_r_prompt
}
