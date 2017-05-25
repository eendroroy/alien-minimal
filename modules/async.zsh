#!/usr/bin/env zsh

cp_set_r_prompt(){
  if [[ $(cp_is_git) == 1 ]]; then
    echo -ne "`cp_bg_count`%F{$clean_vcs_color}G%f `cp_git_branch` `cp_git_rev``cp_git_left_right``cp_git_dirty`"
  elif [[ $(cp_is_hg) == 1 ]]; then
    echo -ne "`cp_bg_count`%F{$clean_vcs_color}M%f `cp_hg_branch` `cp_hg_rev`"
  elif [[ $(cp_is_svn) == 1 ]]; then
    echo -ne "`cp_bg_count`%F{$clean_vcs_color}G%f `cp_svn_rev`"
  else
    echo -ne "`cp_bg_count`"
  fi
}

function ap_dummy(){
}

function ap_lprompt_complete(){
  RPROMPT='`cp_set_r_prompt`'
  zle && zle reset-prompt
  async_stop_worker lprompt -n
}

cp_async_r_prompt(){
  async_init
  async_start_worker lprompt -n
  async_register_callback lprompt ap_lprompt_complete
  async_job lprompt ap_dummy
}