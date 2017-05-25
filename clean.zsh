#!/usr/bin/env zsh

OH_ROOT=${0:A:h}

source "${OH_ROOT}/libs/zsh-async/async.zsh"
source "${OH_ROOT}/libs/zsh-256color/zsh-256color.plugin.zsh"

source "${OH_ROOT}/modules/git.zsh"
source "${OH_ROOT}/modules/hg.zsh"
source "${OH_ROOT}/modules/svn.zsh"
source "${OH_ROOT}/modules/ssh.zsh"
source "${OH_ROOT}/modules/bgjob.zsh"
source "${OH_ROOT}/modules/colors.zsh"


_set_r_prompt(){
  if [[ $(_is_git) == 1 ]]; then
    echo -ne "%F{$_normal}G%f %F{$_br}`_git_branch`%f%F{$_lr}`_git_left_right`%f %F{$_rev}`_git_rev`%f%F{$_dirty}`_git_dirty`%f%F{$_bjob}`_bg_count`%f"
  elif [[ $(_is_hg) == 1 ]]; then
    echo -ne "%F{$_normal}M%f %F{$_br}`_hg_branch`%f %F{$_rev}`_hg_rev`%f%F{$_bjob}`_bg_count`%f"
  elif [[ $(_is_svn) == 1 ]]; then
    echo -ne "%F{$_normal}G%f %F{$_rev}`_svn_rev`%f%F{$_bjob}`_bg_count`%f"
  else
    echo -ne "%F{$_bjob}`_bg_count`%f"
  fi
}

function ap_dummy(){
}

function ap_lprompt_complete() {
  RPROMPT='`_set_r_prompt`'
  zle && zle reset-prompt
  async_stop_worker lprompt -n
}

function precmd() {
  autoload -U add-zsh-hook
  setopt prompt_subst
  PROMPT='%F{$_ssh}`_ssh_st`%f%(?.%F{$_normal}%1~%f.%F{$_error}%B%1~%b%f %F{$_fade} %?%f) '
  RPROMPT=''
  async_init
  async_start_worker lprompt -n
  async_register_callback lprompt ap_lprompt_complete
  async_job lprompt ap_dummy
}
