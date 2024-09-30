#!/usr/bin/env zsh

# shellcheck disable=SC2154
# shellcheck disable=SC2034
# shellcheck disable=SC2116

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


am_r_prompt_render(){
  __r_prompt_val=""
    if [[ -n ${AM_RIGHT_SECTION} ]]; then
      LOOP_INDEX=0
      for section in $(echo "${AM_RIGHT_SECTION}"); do
        [[ ${LOOP_INDEX} != "0" ]] && __r_prompt_val+=" "
        __r_prompt_val+="$($section)"
        LOOP_INDEX=$((LOOP_INDEX + 1))
      done
    fi
  echo -ne "${__r_prompt_val}" | tr -s ' '
}

am_l_prompt_render(){
  __l_prompt_val=""
  if [[ -n ${AM_LEFT_SECTION} ]]; then
    LOOP_INDEX=0
    for section in $(echo "${AM_LEFT_SECTION}"); do
      [[ ${LOOP_INDEX} != "0" ]] && __l_prompt_val+=" "
      __l_prompt_val+="$($section)"
      LOOP_INDEX=$((LOOP_INDEX + 1))
    done
  fi

  [[ "${AM_INITIAL_LINE_FEED}" == 1 ]] && __l_prompt_val=$'\n'"${__l_prompt_val}"
  echo -ne "${__l_prompt_val}" | tr -s ' '
}

r_prompt_completed(){
#  exec &>/dev/tty
  RPROMPT=$(echo "${3}" | tr -s ' ')
  zle && zle reset-prompt
}

am_async_r_prompt(){
  cd "${1}" || return
  async_init
  async_stop_worker "right_prompt_$$"
  async_start_worker "right_prompt_$$" -n
  async_register_callback "right_prompt_$$" r_prompt_completed
  async_job "right_prompt_$$" am_r_prompt_render
}

l_prompt_completed(){
#  exec &>/dev/tty
  PROMPT=$(echo "${3}" | tr -s ' ')
  zle && zle reset-prompt
}

am_async_l_prompt(){
  cd "${1}" || return
  async_init
  async_stop_worker "left_prompt_$$"
  async_start_worker "left_prompt_$$" -n
  async_register_callback "left_prompt_$$" l_prompt_completed
  async_job "left_prompt_$$" am_l_prompt_render
}