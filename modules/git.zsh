#!/usr/bin/env zsh

am_is_git(){
  echo -ne "$(plib_is_git)"
}

am_git_branch(){
  echo -ne "%B%F{$am_branch_color}$(plib_git_branch)%f%b"
}

am_git_rev(){
  echo -ne "%F{$am_rev_color}$(plib_git_rev)%f"
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

  echo "${DIRTY}"

  unset __mod_ut __new_ut __add_ut __mod_t __new_t __add_t __del DIRTY
}

am_git_left_right(){
  [[ -z "${AM_GIT_PUSH_SYM}" ]] && AM_GIT_PUSH_SYM='↑'
  [[ -z "${AM_GIT_PULL_SYM}" ]] && AM_GIT_PULL_SYM='↓'

  __git_left_right=$(plib_git_left_right)

  __pull=$(echo "$__git_left_right" | awk '{print $2}' | tr -d ' \n')
  __push=$(echo "$__git_left_right" | awk '{print $1}' | tr -d ' \n')

  [[ "$__pull" != 0 ]] && [[ "$__pull" != '' ]] && __pushpull="${__pull}${AM_GIT_PULL_SYM}"
  [[ -n "$__pushpull" ]] && __pushpull+=' '
  [[ "$__push" != 0 ]] && [[ "$__push" != '' ]] && __pushpull+="${__push}${AM_GIT_PUSH_SYM}"

  if [[ "$__pushpull" != '' ]]; then
    echo -ne "%F{$am_left_right_color}${__pushpull}%f"
  fi
}

am_git_stash(){
  if [[ "$(plib_git_is_bare)" == 1 ]]; then
    echo -ne "%F{$am_bare_color}${AM_GIT_BARE_SYM}${__stash}%f"
  else
    __stash=$(plib_git_stash)
    if [[ "$__stash" != "0" ]]; then
      echo -ne "%F{$am_stash_color}${AM_GIT_STASH_SYM}${__stash}%f"
    fi
  fi
}

am_git_commit_time(){
  echo -ne "%F{$am_commit_since_color}[$(plib_git_commit_since)]%f"
}

am_git_rebasing(){
  if [[ $(plib_is_git_rebasing) == 1 ]]; then
    echo -ne "%F{$am_error_color}${AM_GIT_REBASING_SYMBOL}%f"
  fi
}
