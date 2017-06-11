#!/usr/bin/env zsh

am_load_colors(){
  am_vcs_color=248
  am_ssh_color=226
  am_normal_color=39
  am_error_color=208
  am_rev_color=248
  am_branch_color=78
  am_dirty_color=202
  am_left_right_color=222
  am_commit_since_color=244
  am_fade_color=242
  am_venv_color=245
}

am_unset_colors(){
  unset am_ssh_color am_normal_color am_error_color am_rev_color am_branch_color am_vcs_color
  unset am_dirty_color am_left_right_color am_bgjob_color am_fade_color am_venv_color
}
