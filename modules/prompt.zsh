#!/usr/bin/env zsh

version_prompt(){
  if [[ -n ${1} ]]; then
    LOOP_INDEX=0
    # shellcheck disable=SC2116
    for _v in $(echo "${1}"); do
      if [[ ${LOOP_INDEX} != "0" ]]; then
        version_prompt_val+="%F{$am_fade_color}|%f"
      fi
      if [[ ${LOOP_INDEX} == "0" ]]; then
        LOOP_INDEX=$((LOOP_INDEX + 1))
        version_prompt_val+="%F{$am_fade_color}[%f"
      fi
      if [[ ${_v} == "PYTHON" ]]; then
         version_prompt_val+="$(am_python_version)"
      fi
      if [[ ${_v} == "RUBY" ]]; then
         version_prompt_val+="$(am_ruby_version)"
      fi
      if [[ ${_v} == "RUBY_S" ]]; then
         version_prompt_val+="$(am_ruby_short_version)"
      fi
      if [[ ${_v} == "JAVA" ]]; then
         version_prompt_val+="$(am_java_version)"
      fi
      if [[ ${_v} == "GO" ]]; then
         version_prompt_val+="$(am_go_version)"
      fi
      if [[ ${_v} == "ELIXIR" ]]; then
         version_prompt_val+="$(am_elixir_version)"
      fi
      if [[ ${_v} == "CRYSTAL" ]]; then
         version_prompt_val+="$(am_crystal_version)"
      fi
      if [[ ${_v} == "NODE" ]]; then
         version_prompt_val+="$(am_node_version)"
      fi
      if [[ ${_v} == "PHP" ]]; then
         version_prompt_val+="$(am_php_version)"
      fi
    done
    if [[ "$LOOP_INDEX" != "0" ]]; then
      version_prompt_val+="%F{$am_fade_color}]%f"
    fi
  fi
  echo -n "${version_prompt_val}"
}

am_vcs_prompt(){
  if [[ $(am_is_git) == 1 ]]; then
    am_vcs_prompt_val="$(am_git_rebasing) %F{$am_vcs_color}${AM_GIT_SYM}:%f$(am_git_branch) $(am_git_commit_time) $(am_git_rev) $(am_git_stash) $(am_git_left_right) $(am_git_dirty)"
  elif [[ $(am_is_hg) == 1 ]]; then
    am_vcs_prompt_val="%F{$am_vcs_color} ${AM_HG_SYM}:%f$(am_hg_branch) $(am_hg_rev)"
  elif [[ $(am_is_svn) == 1 ]]; then
    am_vcs_prompt_val="%F{$am_vcs_color} ${AM_SVN_SYM}:%f$(am_svn_rev)"
  fi
  echo -n "${am_vcs_prompt_val}"
}

am_prompt_general_short_dir(){
  end_tag="%F{$AM_PROMPT_END_TAG_COLOR}${AM_PROMPT_END_TAG}%f"
  if [[ ${AM_ERROR_ON_START_TAG} == 1 && ${AM_PROMPT_START_TAG} != "" ]]; then
    start_tag="%(?.%F{$AM_PROMPT_START_TAG_COLOR}${AM_PROMPT_START_TAG}%f.%F{$am_error_color}${PROMPT_START_TAG}%f)"
    echo -ne "${start_tag}"
    echo -ne "%F{$am_normal_color}%1~%f${end_tag}"
  else
    start_tag="%F{$AM_PROMPT_START_TAG_COLOR}${AM_PROMPT_START_TAG}%f"
    echo -ne "${start_tag}"
    echo -ne "%(?.%F{$am_normal_color}%1~%f${end_tag}.%F{$am_error_color}%B%1~%b%f${end_tag})"
  fi
  [[ ${AM_HIDE_EXIT_CODE} -ne 1 ]] && echo -ne "%(?.. %F{$am_fade_color}%?%f)"
}

am_prompt_general_long_dir(){
  end_tag="%F{$AM_PROMPT_END_TAG_COLOR}${AM_PROMPT_END_TAG}%f"
  if [[ ${AM_ERROR_ON_START_TAG} == 1 && ${AM_PROMPT_START_TAG} != "" ]]; then
    start_tag="%(?.%F{$AM_PROMPT_START_TAG_COLOR}${AM_PROMPT_START_TAG}%f.%F{$am_error_color}${PROMPT_START_TAG}%f)"
    echo -ne "${start_tag}"
    echo -ne "%F{$am_normal_color}%~%f${end_tag}"
  else
    start_tag="%F{$AM_PROMPT_START_TAG_COLOR}${AM_PROMPT_START_TAG}%f"
    echo -ne "${start_tag}"
    echo -ne "%(?.%F{$am_normal_color}%~%f${end_tag}.%F{$am_error_color}%B%~%b%f${end_tag})"
  fi
  [[ ${AM_HIDE_EXIT_CODE} -ne 1 ]] && echo -ne "%(?.. %F{$am_fade_color}%?%f)"
}

am_prompt_complete(){
  cd "$1" || return
  r_prompt_val="$(version_prompt "${2}") $(am_vcs_prompt)$(am_vim_prompt)"
  r_prompt_val="${r_prompt_val%?}"
  unset AM_EMPTY_BUFFER

  echo -n "${r_prompt_val}"
}
