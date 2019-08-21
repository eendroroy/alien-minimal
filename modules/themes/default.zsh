#!/usr/bin/env zsh

am_theme(){
  [[ -z ${am_vcs_color} ]]              && am_vcs_color=248
  [[ -z ${am_ssh_color} ]]              && am_ssh_color=143
  [[ -z ${am_normal_color} ]]           && am_normal_color=39
  [[ -z ${am_error_color} ]]            && am_error_color=208
  [[ -z ${am_rev_color} ]]              && am_rev_color=248
  [[ -z ${am_branch_color} ]]           && am_branch_color=78
  [[ -z ${am_left_right_color} ]]       && am_left_right_color=222
  [[ -z ${am_stash_color} ]]            && am_stash_color=${am_left_right_color}
  [[ -z ${am_bare_color} ]]             && am_bare_color=${am_left_right_color}
  [[ -z ${am_commit_since_color} ]]     && am_commit_since_color=244
  [[ -z ${am_fade_color} ]]             && am_fade_color=242
  [[ -z ${am_venv_color} ]]             && am_venv_color=245
  [[ -z ${am_python_color} ]]           && am_python_color=40
  [[ -z ${am_ruby_color} ]]             && am_ruby_color=196
  [[ -z ${am_java_color} ]]             && am_java_color=178
  [[ -z ${am_go_color} ]]               && am_go_color=81
  [[ -z ${am_crystal_color} ]]          && am_crystal_color=8
  [[ -z ${am_node_color} ]]             && am_node_color=2
  [[ -z ${am_php_color} ]]              && am_php_color=5
  [[ -z ${am_timer_color} ]]            && am_timer_color=248
  [[ -z ${am_viins_color} ]]            && am_viins_color=39
  [[ -z ${am_vicmd_color} ]]            && am_vicmd_color=208
  [[ -z ${AM_PROMPT_START_TAG_COLOR} ]] && AM_PROMPT_START_TAG_COLOR=39
  [[ -z ${AM_PROMPT_END_TAG_COLOR} ]]   && AM_PROMPT_END_TAG_COLOR=39
  [[ -z ${AM_GIT_TRACKED_COLOR} ]]      && AM_GIT_TRACKED_COLOR=78
  [[ -z ${AM_GIT_UN_TRACKED_COLOR} ]]   && AM_GIT_UN_TRACKED_COLOR=208
}
