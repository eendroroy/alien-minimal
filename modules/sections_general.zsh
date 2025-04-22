#!/usr/bin/env zsh

am_version_prompt(){
  if [[ ${#AM_VERSIONS_PROMPT[@]} -ne 0 ]]; then
    LOOP_INDEX=0
    for version in "${AM_VERSIONS_PROMPT[@]}"; do
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
      [[ ${version} == "MAVEN" ]]     && version_prompt_val+="$(am_maven_version)"

      LOOP_INDEX=$((LOOP_INDEX + 1))
    done

    [[ "$LOOP_INDEX" != "0" ]] && version_prompt_val+="%F{$AM_FADE_COLOR}]%f"
  fi

  echo -n "${version_prompt_val}"

  unset LOOP_INDEX version_prompt_val
}

am_vcs_prompt(){
  __vcs_prompt_value=""
  if [[ $(am_is_git) == 1 ]]; then
    if [[ ${#AM_GIT_SECTION[@]} -ne 0 ]]; then
      LOOP_INDEX=0
      for section in "${AM_GIT_SECTION[@]}"; do
        [[ ${LOOP_INDEX} != "0" ]] && __vcs_prompt_value+=" "
        __vcs_prompt_value+="$($section)"
        LOOP_INDEX=$((LOOP_INDEX + 1))
      done
    fi
  elif [[ $(am_is_hg) == 1 ]]; then
    if [[ ${#AM_HG_SECTION[@]} -ne 0 ]]; then
      LOOP_INDEX=0
      for section in "${AM_GIT_SECTION[@]}"; do
        [[ ${LOOP_INDEX} != "0" ]] && __vcs_prompt_value+=" "
        __vcs_prompt_value+="$($section)"
        LOOP_INDEX=$((LOOP_INDEX + 1))
      done
    fi
  elif [[ $(am_is_svn) == 1 ]]; then
    if [[ ${#AM_SVN_SECTION[@]} -ne 0 ]]; then
      LOOP_INDEX=0
      for section in "${AM_GIT_SECTION[@]}"; do
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

am_space(){
  echo -ne " "
}

am_is_git(){
  echo -ne "$(plib_is_git)"
}

am_git_branch(){
  echo -ne "%B%F{$AM_BRANCH_COLOR}$(plib_git_branch)%f%b"
}

am_git_rev(){
  echo -ne "%F{$AM_REV_COLOR}$(plib_git_rev)%f"
}

am_git_dirty(){
  [[ -z "${AM_GIT_TRACKED_COLOR}" ]]    && AM_GIT_TRACKED_COLOR=green
  [[ -z "${AM_GIT_UN_TRACKED_COLOR}" ]] && AM_GIT_UN_TRACKED_COLOR=red

  [[ -z "${AM_GIT_ADD_SYM}" ]] && AM_GIT_ADD_SYM='+'
  [[ -z "${AM_GIT_DEL_SYM}" ]] && AM_GIT_DEL_SYM='-'
  [[ -z "${AM_GIT_MOD_SYM}" ]] && AM_GIT_MOD_SYM='⭑'
  [[ -z "${AM_GIT_NEW_SYM}" ]] && AM_GIT_NEW_SYM='?'

  __git_status=$(plib_git_status)

  __mod_t=$(plib_git_staged_mod "$__git_status")
  __add_t=$(plib_git_staged_add "$__git_status")
  __del_t=$(plib_git_staged_del "$__git_status")

  __mod_ut=$(plib_git_unstaged_mod "$__git_status")
  __add_ut=$(plib_git_unstaged_add "$__git_status")
  __del_ut=$(plib_git_unstaged_del "$__git_status")

  __new=$(plib_git_status_new "$__git_status")

  DIRTY=''
  [[ "$__add_t" != "0" ]]  && DIRTY+="%F{$AM_GIT_TRACKED_COLOR}${AM_GIT_ADD_SYM}%f "
  [[ "$__add_ut" != "0" ]] && DIRTY+="%F{$AM_GIT_UN_TRACKED_COLOR}${AM_GIT_ADD_SYM}%f "
  [[ "$__mod_t" != "0" ]]  && DIRTY+="%F{$AM_GIT_TRACKED_COLOR}${AM_GIT_MOD_SYM}%f "
  [[ "$__mod_ut" != "0" ]] && DIRTY+="%F{$AM_GIT_UN_TRACKED_COLOR}${AM_GIT_MOD_SYM}%f "
  [[ "$__del_t" != "0" ]]  && DIRTY+="%F{$AM_GIT_TRACKED_COLOR}${AM_GIT_DEL_SYM}%f "
  [[ "$__del_ut" != "0" ]] && DIRTY+="%F{$AM_GIT_UN_TRACKED_COLOR}${AM_GIT_DEL_SYM}%f "
  [[ "$__new" != "0" ]]    && DIRTY+="%F{$AM_GIT_UN_TRACKED_COLOR}${AM_GIT_NEW_SYM}%f "

  if [[ "$DIRTY" != '' ]]; then
    echo -ne "${DIRTY}"
  fi

  unset __git_status __mod_t __add_t __del_t __mod_ut __add_ut __del_ut __new DIRTY
}

am_git_left_right(){
  [[ -z "${AM_GIT_PUSH_SYM}" ]] && AM_GIT_PUSH_SYM='↑'
  [[ -z "${AM_GIT_PULL_SYM}" ]] && AM_GIT_PULL_SYM='↓'

  __git_left_right=$(plib_git_left_right)

  __pull=$(echo "$__git_left_right" | awk '{print $2}' | tr -d ' \n')
  __push=$(echo "$__git_left_right" | awk '{print $1}' | tr -d ' \n')

  [[ "$__pull" != 0 ]] && [[ "$__pull" != '' ]] && __push_pull="${__pull}${AM_GIT_PULL_SYM}"
  [[ -n "$__push_pull" ]] && __push_pull+=' '
  [[ "$__push" != 0 ]] && [[ "$__push" != '' ]] && __push_pull+="${__push}${AM_GIT_PUSH_SYM}"

  if [[ "$__push_pull" != '' ]]; then
    echo -ne "%F{$AM_LEFT_RIGHT_COLOR}${__push_pull}%f"
  fi

  unset __git_left_right __pull __push __push_pull
}

am_git_left_right_master(){
  [[ -z "${AM_LEFT_RIGHT_SEP}" ]] && AM_LEFT_RIGHT_SEP='|'

  __git_left_right=$(plib_git_left_right_master)

  __left=$(echo "$__git_left_right" | awk '{print $1}' | tr -d ' \n')
  __right=$(echo "$__git_left_right" | awk '{print $2}' | tr -d ' \n')

  __left_right="${__left}${AM_LEFT_RIGHT_SEP}${__right}"

  if [[ "$__left_right" != '0|0' ]]; then
    echo -ne "%F{$AM_LEFT_RIGHT_COLOR}${__left}${AM_LEFT_RIGHT_SEP}${__right}%f"
  fi

  unset __git_left_right __left __right __left_right
}

am_git_stash(){
  if [[ "$(plib_git_is_bare)" == 1 ]]; then
    echo -ne "%F{$AM_BARE_COLOR}${AM_GIT_BARE_SYM}${__stash}%f"
  else
    __stash=$(plib_git_stash)
    if [[ "$__stash" != "0" ]]; then
      echo -ne "%F{$AM_STASH_COLOR}${AM_GIT_STASH_SYM}${__stash}%f"
    fi
  fi
}

am_git_commit_time(){
  echo -ne "%F{$AM_COMMIT_SINCE_COLOR}[$(plib_git_commit_since)]%f"
}

am_git_rebasing(){
  if [[ $(plib_is_git_rebasing) == 1 ]]; then
    echo -ne "%F{$AM_ERROR_COLOR}${AM_GIT_REBASING_SYMBOL}%f"
  fi
}

am_git_symbol(){
  echo -ne "%F{$AM_VCS_COLOR}${AM_GIT_SYM}%f"
}

am_is_hg(){
  echo -ne "$(plib_is_hg)"
}

am_hg_branch(){
  echo -ne "%B%F{$AM_BRANCH_COLOR}$(plib_hg_branch)%f%b";
}

am_hg_rev(){
  echo -ne "%F{$AM_REV_COLOR}$(plib_hg_rev)%f";
}

am_hg_symbol(){
  echo -ne "%F{$AM_VCS_COLOR}${AM_HG_SYM}:%f"
}

am_is_svn(){
  plib_is_svn
}

am_svn_rev(){
  echo -n "%B%F{$AM_REV_COLOR}$(plib_svn_rev)%f%b";
}

am_svn_symbol(){
  echo -ne "%F{$AM_VCS_COLOR}${AM_SVN_SYM}:%f"
}

am_ssh_st(){
  __ssh_st=$(plib_ssh_st)
  if [[ ${__ssh_st} != "" ]]
	then
    echo -n "%F{$AM_SSH_COLOR}${AM_SSH_SYM}%f"
  else
    echo -ne ""
  fi
}