#!/usr/bin/env zsh

am_r_prompt(){
  if [[ $(am_is_git) == 1 ]]; then
      echo -ne "`am_bg_count``am_git_rebasing`%F{$am_vcs_color}G:%f`am_git_branch``am_git_commit_time` `am_git_rev``am_git_left_right``am_git_dirty`"
  elif [[ $(am_is_hg) == 1 ]]; then
    echo -ne "`am_bg_count`%F{$am_vcs_color}M:%f`am_hg_branch` `am_hg_rev`"
  elif [[ $(am_is_svn) == 1 ]]; then
    echo -ne "`am_bg_count`%F{$am_vcs_color}S:%f`am_svn_rev`"
  else
    echo -ne "`am_bg_count`"
  fi
}

function am_prompt_general_short_dir(){
  end_tag="%F{$PROMPT_END_TAG_COLOR}${PROMPT_END_TAG}%f"
  if [[ $AM_ERROR_ON_START_TAG == 1 && $PROMPT_START_TAG != "" ]]; then
    start_tag="%(?.%F{$PROMPT_START_TAG_COLOR}${PROMPT_START_TAG}%f.%F{$am_error_color}${PROMPT_START_TAG}%f)"
    echo -ne "${start_tag}"
    echo -ne "%F{$am_normal_color}%1~%f${end_tag}"
  else
    start_tag="%F{$PROMPT_START_TAG_COLOR}${PROMPT_START_TAG}%f"
    echo -ne "${start_tag}"
    echo -ne "%(?.%F{$am_normal_color}%1~%f${end_tag}.%F{$am_error_color}%B%1~%b%f${end_tag})"
  fi
  [[ $AM_HIDE_EXIT_CODE -ne 1 ]] && echo -ne "%(?.. %F{$am_fade_color}%?%f)"
}

function am_prompt_general_long_dir(){
  end_tag="%F{$PROMPT_END_TAG_COLOR}${PROMPT_END_TAG}%f"
  if [[ $AM_ERROR_ON_START_TAG == 1 && $PROMPT_START_TAG != "" ]]; then
    start_tag="%(?.%F{$PROMPT_START_TAG_COLOR}${PROMPT_START_TAG}%f.%F{$am_error_color}${PROMPT_START_TAG}%f)"
    echo -ne "${start_tag}"
    echo -ne "%F{$am_normal_color}%~%f${end_tag}"
  else
    start_tag="%F{$PROMPT_START_TAG_COLOR}${PROMPT_START_TAG}%f"
    echo -ne "${start_tag}"
    echo -ne "%(?.%F{$am_normal_color}%~%f${end_tag}.%F{$am_error_color}%B%~%b%f${end_tag})"
  fi
  [[ $AM_HIDE_EXIT_CODE -ne 1 ]] && echo -ne "%(?.. %F{$am_fade_color}%?%f)"
}

function am_prompt_complete(){
  if [[ $AM_UPDATE_L_PROMPT == 1 ]];then
    PROMPT='`am_ssh_st`$__time`am_venv` `am_prompt_general_short_dir` '
    zle && zle reset-prompt
  fi
  RPROMPT='`version_prompt` `am_r_prompt`'
  zle && zle reset-prompt
  async_stop_worker prompt -n
}

