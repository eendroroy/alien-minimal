#!/usr/bin/env zsh

version_prompt(){
  if [[ ! -z ${AM_VERSIONS_PROMPT} ]]; then
    LOOP_INDEX=0
    for _v in ${AM_VERSIONS_PROMPT}; do
      [[ ${LOOP_INDEX} != "0" ]] && echo -ne "%F{$am_fade_color}|%f"
      [[ ${LOOP_INDEX} == "0" ]] && LOOP_INDEX=$((${LOOP_INDEX} + 1)) && echo -ne "%F{$am_fade_color}[%f"
      [[ ${_v} == "PYTHON" ]] && echo -ne $(am_python_version)
      [[ ${_v} == "RUBY" ]] && echo -ne $(am_ruby_version)
      [[ ${_v} == "JAVA" ]] && echo -ne $(am_java_version)
      [[ ${_v} == "GO" ]] && echo -ne $(am_go_version)
      [[ ${_v} == "CRYSTAL" ]] && echo -ne $(am_crystal_version)
      [[ ${_v} == "NODE" ]] && echo -ne $(am_node_version)
      [[ ${_v} == "PHP" ]] && echo -ne $(am_php_version)
    done
    [[ "$LOOP_INDEX" != "0" ]] && echo -ne "%F{$am_fade_color}]%f"
  fi
}

am_echo_git_prompt() {
  GIT_REBASING=$(am_git_rebasing)
  if [[ "$GIT_REBASING" != '' ]]; then
    GIT_PROMPT+="$GIT_REBASING "
  fi

  GIT_PROMPT+="%F{$am_vcs_color}${AM_GIT_SYM}:%f$(am_git_branch)$(am_git_commit_time) $(am_git_rev) "

  STASH=$(am_git_stash)
  if [[ "$STASH" != '' ]]; then
    GIT_PROMPT+="$STASH "
  fi

  LEFT_RIGHT=$(am_git_left_right)
  if [[ "$LEFT_RIGHT" != '' ]]; then
    GIT_PROMPT+="$LEFT_RIGHT "
  fi

  DIRTY=$(am_git_dirty)
  if [[ "$DIRTY" != '' ]]; then
    GIT_PROMPT+="$DIRTY "
  fi

  # Echo prompt without trailing space.
  echo -ne "${GIT_PROMPT%?}"

  unset GIT_PROMPT
}

am_vcs_prompt(){
  if [[ $(am_is_git) == 1 ]]; then
    am_echo_git_prompt
  elif [[ $(am_is_hg) == 1 ]]; then
    echo -ne "%F{$am_vcs_color} ${AM_HG_SYM}:%f$(am_hg_branch) $(am_hg_rev)"
  elif [[ $(am_is_svn) == 1 ]]; then
    echo -ne "%F{$am_vcs_color} ${AM_SVN_SYM}:%f$(am_svn_rev)"
  fi
}

function am_prompt_general_short_dir(){
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

function am_prompt_general_long_dir(){
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

function am_prompt_complete(){
  if [[ ${AM_UPDATE_L_PROMPT} == 1 ]];then
    PROMPT="$(am_ssh_st)${__time}$(am_venv) $(am_prompt_general_short_dir) "
    if [[ ${AM_INITIAL_LINE_FEED} == 1 ]]; then
      PROMPT=$'\n'"${PROMPT}"
    elif [[ ${AM_INITIAL_LINE_FEED} == 2 && ${AM_EMPTY_BUFFER} == 1 ]]; then
      PROMPT=$'\n'"${PROMPT}"
    fi
    zle && zle reset-prompt
  fi
  if [[ ${AM_SEGMENT_UPDATE} == 1 ]]; then
    RPROMPT=''

    VERSION_PROMPT=$(version_prompt)
    if [[ "$VERSION_PROMPT" != '' ]]; then
      RPROMPT+="$VERSION_PROMPT"
      zle && zle reset-prompt
    fi

    BG_COUNT=$(am_bg_count)
    if [[ "$BG_COUNT" != '' ]]; then
      if [[ "$RPROMPT" != '' ]]; then
        RPROMPT+=' '
      fi
      
      RPROMPT+="$BG_COUNT"
      zle && zle reset-prompt
    fi

    VCS_PROMPT=$(am_vcs_prompt)
    if [[ "$VCS_PROMPT" != '' ]]; then
      if [[ "$RPROMPT" != '' ]]; then
        RPROMPT+=' '
      fi
      
      RPROMPT+="VCS_PROMPT"
      zle && zle reset-prompt
    fi

    VIM_PROMPT=$(am_vim_prompt)
    if [[ "$VIM_PROMPT" != '' ]]; then
      if [[ "$RPROMPT" != '' ]]; then
        RPROMPT+=' '
      fi
      
      RPROMPT+="$VIM_PROMPT"
      zle && zle reset-prompt
    fi
  else
    RPROMPT=''

    VERSION_PROMPT=$(version_prompt)
    if [[ "$VERSION_PROMPT" != '' ]]; then
      RPROMPT+="$VERSION_PROMPT "
    fi

    BG_COUNT=$(am_bg_count)
    if [[ "$BG_COUNT" != '' ]]; then
      RPROMPT+="$BG_COUNT "
    fi

    VCS_PROMPT=$(am_vcs_prompt)
    if [[ "$VCS_PROMPT" != '' ]]; then
      RPROMPT+="$VCS_PROMPT "
    fi

    VIM_PROMPT=$(am_vim_prompt)
    if [[ "$VIM_PROMPT" != '' ]]; then
      RPROMPT+="$VIM_PROMPT "
    fi
    
    # Remove trailing space.
    RPROMPT="${RPROMPT%?}"

    zle && zle reset-prompt
  fi
  async_stop_worker prompt -n
  unset AM_EMPTY_BUFFER
}
