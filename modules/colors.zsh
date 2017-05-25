#!/usr/bin/env zsh

clean_vcs_color=248
clean_ssh_color=226
clean_normal_color=39
clean_error_color=208
clean_rev_color=248
clean_branch_color=78
clean_dirty_color=202
clean_left_right_color=222
clean_fade_color=242

am_unset_colors(){
  unset clean_ssh_color clean_normal_color clean_error_color clean_rev_color clean_branch_color clean_vcs_color
  unset clean_dirty_color clean_left_right_color clean_bgjob_color clean_fade_color
}