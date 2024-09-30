#!/usr/bin/env zsh

# shellcheck disable=SC2154
# shellcheck disable=SC2034
# shellcheck disable=SC2116

__import_env() {
  env | grep --color=never "ENV_VERSION=\|^VIRTUAL_ENV=\|^AM_" | while IFS='\n' read -r line; do
    eval "export $(echo "${line}" | awk -F'=' '{print $1"=\""$2"\""}')" > /dev/null
  done
}

am_version_prompt(){
  if [[ -n ${AM_VERSIONS_PROMPT} ]]; then
    LOOP_INDEX=0
    for version in $(echo "${AM_VERSIONS_PROMPT}"); do
      [[ ${LOOP_INDEX} == "0" ]] && version_prompt_val+="%F{$AM_FADE_COLOR}[%f"
      [[ ${LOOP_INDEX} != "0" ]] && version_prompt_val+="%F{$AM_FADE_COLOR}${AM_VERSION_PROMPT_SEP}%f"

      [[ ${version} == "PYTHON" ]]    && version_prompt_val+="$(am_python_version)"
      [[ ${version} == "PYTHON_S" ]]  && version_prompt_val+="$(am_python_short_version)"
      [[ ${version} == "RUBY" ]]      && version_prompt_val+="$(am_ruby_version)"
      [[ ${version} == "RUBY_S" ]]    && version_prompt_val+="$(am_ruby_short_version)"
      [[ ${version} == "JAVA" ]]      && version_prompt_val+="$(am_java_version)"
      [[ ${version} == "JAVA_S" ]]    && version_prompt_val+="$(am_java_short_version)"
      [[ ${version} == "GO" ]]        && version_prompt_val+="$(am_go_version)"
      [[ ${version} == "GO_S" ]]      && version_prompt_val+="$(am_go_short_version)"
      [[ ${version} == "ELIXIR" ]]    && version_prompt_val+="$(am_elixir_version)"
      [[ ${version} == "ELIXIR_S" ]]  && version_prompt_val+="$(am_elixir_short_version)"
      [[ ${version} == "CRYSTAL" ]]   && version_prompt_val+="$(am_crystal_version)"
      [[ ${version} == "CRYSTAL_S" ]] && version_prompt_val+="$(am_crystal_short_version)"
      [[ ${version} == "NODE" ]]      && version_prompt_val+="$(am_node_version)"
      [[ ${version} == "NODE_S" ]]    && version_prompt_val+="$(am_node_short_version)"
      [[ ${version} == "PHP" ]]       && version_prompt_val+="$(am_php_version)"
      [[ ${version} == "PHP_S" ]]     && version_prompt_val+="$(am_php_short_version)"
      [[ ${version} == "GRADLE" ]]    && version_prompt_val+="$(am_gradle_version)"
      [[ ${version} == "MAVEN" ]]    && version_prompt_val+="$(am_maven_version)"

      LOOP_INDEX=$((LOOP_INDEX + 1))
    done

    [[ "$LOOP_INDEX" != "0" ]] && version_prompt_val+="%F{$AM_FADE_COLOR}]%f"
  fi
  echo -n "${version_prompt_val}"
}

am_vcs_prompt(){
  __vcs_prompt_value=""
  if [[ $(am_is_git) == 1 ]]; then
    if [[ -n ${AM_GIT_SECTION} ]]; then
      LOOP_INDEX=0
      for section in $(echo "${AM_GIT_SECTION}"); do
        [[ ${LOOP_INDEX} != "0" ]] && __vcs_prompt_value+=" "
        __vcs_prompt_value+="$($section)"
        LOOP_INDEX=$((LOOP_INDEX + 1))
      done
    fi
  elif [[ $(am_is_hg) == 1 ]]; then
    if [[ -n ${AM_HG_SECTION} ]]; then
      LOOP_INDEX=0
      for section in $(echo "${AM_GIT_SECTION}"); do
        [[ ${LOOP_INDEX} != "0" ]] && __vcs_prompt_value+=" "
        __vcs_prompt_value+="$($section)"
        LOOP_INDEX=$((LOOP_INDEX + 1))
      done
    fi
  elif [[ $(am_is_svn) == 1 ]]; then
    if [[ -n ${AM_SVN_SECTION} ]]; then
      LOOP_INDEX=0
      for section in $(echo "${AM_GIT_SECTION}"); do
        [[ ${LOOP_INDEX} != "0" ]] && __vcs_prompt_value+=" "
        __vcs_prompt_value+="$($section)"
        LOOP_INDEX=$((LOOP_INDEX + 1))
      done
    fi
  fi
  echo -ne "${__vcs_prompt_value}"
  unset __vcs_prompt_value LOOP_INDEX
}

am_prompt_end_tag() {
  echo -ne "%F{$AM_PROMPT_END_TAG_COLOR}${AM_PROMPT_END_TAG}%f"
}

am_prompt_start_tag(){
  if [[ ${AM_ERROR_ON_START_TAG} == 1 && ${AM_PROMPT_START_TAG} != "" ]]; then
    echo -ne "%(?.%F{$AM_PROMPT_START_TAG_COLOR}${AM_PROMPT_START_TAG}%f.%F{$AM_ERROR_COLOR}${AM_PROMPT_START_TAG}%f)"
  else
    echo -ne "%F{$AM_PROMPT_START_TAG_COLOR}${AM_PROMPT_START_TAG}%f"
  fi
}

am_prompt_dir(){
  if [[ ${AM_ERROR_ON_START_TAG} == 1 && ${AM_PROMPT_START_TAG} != "" ]]; then
    echo -ne "%F{$AM_NORMAL_COLOR}%${AM_DIR_EXPANSION_LEVEL}~%f"
  else
    echo -ne "%(?.%F{$AM_NORMAL_COLOR}%${AM_DIR_EXPANSION_LEVEL}~%f.%F{$AM_ERROR_COLOR}%B%${AM_DIR_EXPANSION_LEVEL}~%b%f)"
  fi
  [[ ${AM_HIDE_EXIT_CODE} -ne 1 ]] && echo -ne "%(?.. %F{$AM_FADE_COLOR}%?%f)"
}

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
  if [[ ${AM_ENABLE_VI_PROMPT} == 1 ]]; then
    [[ ${AM_VI_PROMPT_POS} == 'right_start' ]] && __r_prompt_val="${AM_VI_PROMPT_VAL}${__r_prompt_val}"
    [[ ${AM_VI_PROMPT_POS} == 'right_end' ]] && __r_prompt_val="${__r_prompt_val}${AM_VI_PROMPT_VAL}"
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

  if [[ ${AM_ENABLE_VI_PROMPT} == 1 ]]; then
    [[ ${AM_VI_PROMPT_POS} == 'left_start' ]] && __l_prompt_val="${AM_VI_PROMPT_VAL}${__l_prompt_val}"
    [[ ${AM_VI_PROMPT_POS} == 'left_end' ]] && __l_prompt_val="${__l_prompt_val}${AM_VI_PROMPT_VAL} "
  fi
  [[ "${AM_INITIAL_LINE_FEED}" == 1 ]] && __l_prompt_val=$'\n'"${__l_prompt_val}"
  echo -ne "${__l_prompt_val}" | tr -s ' '
}
