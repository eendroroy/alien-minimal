#!/usr/bin/env zsh

# shellcheck disable=SC2154
# shellcheck disable=SC2034
# shellcheck disable=SC2116

__import_env() {
  echo "${1}" | while read -r line; do
    eval "export ${line}" > /dev/null
  done
}

envvar_value(){
  echo `echo | awk -v VAR="\\$${1}" '{print VAR}'`
}

envvar_prompt(){
  if [[ -n ${1} ]]; then
    LOOP_INDEX=0
    for _var in $(echo "${1}"); do
        [[ ${LOOP_INDEX} != "0" ]] && envvar_prompt_val+="%F{$AM_FADE_COLOR}${AM_VERSION_PROMPT_SEP}%f"
        [[ ${LOOP_INDEX} == "0" ]] && LOOP_INDEX=$((LOOP_INDEX + 1)) && envvar_prompt_val+="%F{$AM_FADE_COLOR}[%f"
        [[ ${_var} != "" ]] && envvar_prompt_val+="${_var}:$(envvar_value "${_var}")"
    done
    [[ "$LOOP_INDEX" != "0" ]] && envvar_prompt_val+="%F{$AM_FADE_COLOR}]%f"
  fi
  echo -n "${envvar_prompt_val}"
}

version_prompt(){
  if [[ -n ${1} ]]; then
    LOOP_INDEX=0
    for _v in $(echo "${1}"); do
      [[ ${LOOP_INDEX} != "0" ]] && version_prompt_val+="%F{$AM_FADE_COLOR}${AM_VERSION_PROMPT_SEP}%f"
      [[ ${LOOP_INDEX} == "0" ]] && LOOP_INDEX=$((LOOP_INDEX + 1)) && version_prompt_val+="%F{$AM_FADE_COLOR}[%f"

      [[ ${_v} == "PYTHON" ]]    && version_prompt_val+="$(am_python_version)"
      [[ ${_v} == "PYTHON_S" ]]  && version_prompt_val+="$(am_python_short_version)"
      [[ ${_v} == "RUBY" ]]      && version_prompt_val+="$(am_ruby_version)"
      [[ ${_v} == "RUBY_S" ]]    && version_prompt_val+="$(am_ruby_short_version)"
      [[ ${_v} == "JAVA" ]]      && version_prompt_val+="$(am_java_version)"
      [[ ${_v} == "JAVA_S" ]]    && version_prompt_val+="$(am_java_short_version)"
      [[ ${_v} == "GO" ]]        && version_prompt_val+="$(am_go_version)"
      [[ ${_v} == "GO_S" ]]      && version_prompt_val+="$(am_go_short_version)"
      [[ ${_v} == "ELIXIR" ]]    && version_prompt_val+="$(am_elixir_version)"
      [[ ${_v} == "ELIXIR_S" ]]  && version_prompt_val+="$(am_elixir_short_version)"
      [[ ${_v} == "CRYSTAL" ]]   && version_prompt_val+="$(am_crystal_version)"
      [[ ${_v} == "CRYSTAL_S" ]] && version_prompt_val+="$(am_crystal_short_version)"
      [[ ${_v} == "NODE" ]]      && version_prompt_val+="$(am_node_version)"
      [[ ${_v} == "NODE_S" ]]    && version_prompt_val+="$(am_node_short_version)"
      [[ ${_v} == "PHP" ]]       && version_prompt_val+="$(am_php_version)"
      [[ ${_v} == "PHP_S" ]]     && version_prompt_val+="$(am_php_short_version)"
    done

    [[ "$LOOP_INDEX" != "0" ]] && version_prompt_val+="%F{$AM_FADE_COLOR}]%f"
  fi
  echo -n "${version_prompt_val}"
}

am_vcs_prompt(){
  if [[ $(am_is_git) == 1 ]]; then
    am_vcs_prompt_val="$(am_git_rebasing) %F{$AM_VCS_COLOR}${AM_GIT_SYM}:%f$(am_git_branch) $(am_git_commit_time) $(am_git_rev) $(am_git_stash) $(am_git_left_right) $(am_git_dirty)"
  elif [[ $(am_is_hg) == 1 ]]; then
    am_vcs_prompt_val="%F{$AM_VCS_COLOR} ${AM_HG_SYM}:%f$(am_hg_branch) $(am_hg_rev)"
  elif [[ $(am_is_svn) == 1 ]]; then
    am_vcs_prompt_val="%F{$AM_VCS_COLOR} ${AM_SVN_SYM}:%f$(am_svn_rev)"
  fi
  echo -n "${am_vcs_prompt_val}"
}

am_prompt_dir(){
  end_tag="%F{$AM_PROMPT_END_TAG_COLOR}${AM_PROMPT_END_TAG}%f"
  if [[ ${AM_ERROR_ON_START_TAG} == 1 && ${AM_PROMPT_START_TAG} != "" ]]; then
    start_tag="%(?.%F{$AM_PROMPT_START_TAG_COLOR}${AM_PROMPT_START_TAG}%f.%F{$AM_ERROR_COLOR}${PROMPT_START_TAG}%f)"
    echo -ne "${start_tag}"
    echo -ne "%F{$AM_NORMAL_COLOR}%${AM_DIR_EXPANSION_LEVEL}~%f${end_tag}"
  else
    start_tag="%F{$AM_PROMPT_START_TAG_COLOR}${AM_PROMPT_START_TAG}%f"
    echo -ne "${start_tag}"
    echo -ne "%(?.%F{$AM_NORMAL_COLOR}%${AM_DIR_EXPANSION_LEVEL}~%f${end_tag}.%F{$AM_ERROR_COLOR}%B%${AM_DIR_EXPANSION_LEVEL}~%b%f${end_tag})"
  fi
  [[ ${AM_HIDE_EXIT_CODE} -ne 1 ]] && echo -ne "%(?.. %F{$AM_FADE_COLOR}%?%f)"
}

am_r_prompt_render(){
  cd "${1}" || return
  __import_env "${2}"
  r_prompt_val=" $(envvar_prompt "${4}") $(version_prompt "${3}") $(am_vcs_prompt)"
  if [[ ${AM_ENABLE_VI_PROMPT} == 1 ]]; then
    [[ ${AM_VI_PROMPT_POS} == 'right_start' ]] && r_prompt_val='${AM_VI_PROMPT_VAL}'"${r_prompt_val}"
    [[ ${AM_VI_PROMPT_POS} == 'right_end' ]] && r_prompt_val="${r_prompt_val}"'${AM_VI_PROMPT_VAL}'
  fi
  [[ "${AM_INITIAL_LINE_FEED}" == 1 && "${AM_TWO_LINES}" == 1 ]] && r_prompt_val=$'\n'"${r_prompt_val}"
  unset AM_EMPTY_BUFFER
  echo -n "${r_prompt_val}"
}

am_l_prompt_render(){
  cd "${1}" || return
  __import_env "${2}"
  l_prompt_val="$(am_ssh_st) $(am_venv) $(am_prompt_dir) "
  if [[ ${AM_ENABLE_VI_PROMPT} == 1 ]]; then
    [[ ${AM_VI_PROMPT_POS} == 'left_start' ]] && l_prompt_val='${AM_VI_PROMPT_VAL}'"${l_prompt_val}"
    [[ ${AM_VI_PROMPT_POS} == 'left_end' ]] && l_prompt_val="${l_prompt_val}"'${AM_VI_PROMPT_VAL} '
  fi
  [[ "${AM_INITIAL_LINE_FEED}" == 1 && "${AM_TWO_LINES}" == 0 ]] && l_prompt_val=$'\n'"${l_prompt_val}"
  unset AM_EMPTY_BUFFER
  echo -n "${l_prompt_val}"
}
