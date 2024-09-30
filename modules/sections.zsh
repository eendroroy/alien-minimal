#!/usr/bin/env zsh

[[ -z "${AM_VERSIONS_PROMPT}" ]] && AM_VERSIONS_PROMPT=()

[[ -z "${AM_GIT_SECTION}" ]] && AM_GIT_SECTION=(
  am_git_symbol
  am_git_rebasing
  am_git_branch
  am_git_left_right_master
  am_git_commit_time
  am_git_rev
  am_git_stash
  am_git_left_right
  am_git_dirty
)

[[ -z "${AM_HG_SECTION}" ]] && AM_HG_SECTION=(
  am_hg_symbol
  am_hg_branch
  am_hg_rev
)

[[ -z "${AM_SVN_SECTION}" ]] && AM_SVN_SECTION=(
  am_svn_symbol
  am_svn_rev
)

[[ -z "${AM_LEFT_SECTION}" ]] && AM_LEFT_SECTION=(
  am_ssh_st
  am_prompt_start_tag
  am_prompt_dir
  am_prompt_end_tag
  am_venv
)

[[ -z "${AM_RIGHT_SECTION}" ]] && AM_RIGHT_SECTION=(
  am_version_prompt
  am_vcs_prompt
)
