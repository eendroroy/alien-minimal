#!/usr/bin/env zsh

am_set_r_prompt(){
  if [[ $(am_is_git) == 1 ]]; then
      echo -ne "`am_bg_count`%F{$am_vcs_color}G%f `am_git_branch``am_git_commit_time` `am_git_rev``am_git_left_right``am_git_dirty`"
  elif [[ $(am_is_hg) == 1 ]]; then
    echo -ne "`am_bg_count`%F{$am_vcs_color}M%f `am_hg_branch` `am_hg_rev`"
  elif [[ $(am_is_svn) == 1 ]]; then
    echo -ne "`am_bg_count`%F{$am_vcs_color}G%f `am_svn_rev`"
  else
    echo -ne "`am_bg_count`"
  fi
}

function ap_dummy(){
}

function ap_lprompt_complete(){
  RPROMPT='`am_set_r_prompt`'
  zle && zle reset-prompt
  async_stop_worker lprompt -n
  am_unset_colors
}

am_async_r_prompt(){
  async_init
  async_start_worker lprompt -n
  async_register_callback lprompt ap_lprompt_complete
  async_job lprompt ap_dummy
}
