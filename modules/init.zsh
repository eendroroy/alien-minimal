#!/usr/bin/env zsh

if [[ $USE_NERD_FONT = 1 ]]; then
  [[ -z "${AM_GIT_SYM}" ]]        && AM_GIT_SYM=
  [[ -z "${PLIB_GIT_ADD_SYM}" ]]  && PLIB_GIT_ADD_SYM=
  [[ -z "${PLIB_GIT_DEL_SYM}" ]]  && PLIB_GIT_DEL_SYM=
  [[ -z "${PLIB_GIT_MOD_SYM}" ]]  && PLIB_GIT_MOD_SYM=
  [[ -z "${PLIB_GIT_NEW_SYM}" ]]  && PLIB_GIT_NEW_SYM=
  [[ -z "${PLIB_GIT_PUSH_SYM}" ]] && PLIB_GIT_PUSH_SYM=
  [[ -z "${PLIB_GIT_PULL_SYM}" ]] && PLIB_GIT_PULL_SYM=
  [[ -z "${AM_HG_SYM}" ]]         && AM_HG_SYM=
  [[ -z "${AM_SSH_SYM}" ]]        && AM_SSH_SYM=
  [[ -z "${AM_JAVA_SYM}" ]]       && AM_JAVA_SYM=' '
  [[ -z "${AM_PY_SYM}" ]]         && AM_PY_SYM=' '
  [[ -z "${AM_RB_SYM}" ]]         && AM_RB_SYM=' '
fi

[[ -z "${AM_JAVA_SYM}" ]]  && AM_JAVA_SYM=''
[[ -z "${AM_PY_SYM}" ]]    && AM_PY_SYM=''
[[ -z "${AM_RB_SYM}" ]]    && AM_RB_SYM=''
[[ -z "${AM_GIT_SYM}" ]] && AM_GIT_SYM=G
[[ -z "${AM_HG_SYM}" ]]  && AM_HG_SYM=H
[[ -z "${AM_SVN_SYM}" ]] && AM_SVN_SYM=S
[[ -z "${AM_SSH_SYM}" ]] && AM_SSH_SYM=[S]

[[ -z "${PLIB_GIT_PUSH_SYM}" ]] && PLIB_GIT_PUSH_SYM=↑
[[ -z "${PLIB_GIT_PULL_SYM}" ]] && PLIB_GIT_PULL_SYM=↓

[[ -z "${PROMPT_START_TAG}" ]]       && PROMPT_START_TAG=''
[[ -z "${PROMPT_END_TAG}" ]]         && PROMPT_END_TAG=''

if [[ "$AM_USE_TERMINAL_COLOR" == "1" ]]; then
  [[ -z "${PROMPT_START_TAG_COLOR}" ]] && PROMPT_START_TAG_COLOR=12
  [[ -z "${PROMPT_END_TAG_COLOR}" ]]   && PROMPT_END_TAG_COLOR=12

  [[ -z "${PLIB_GIT_TRACKED_COLOR}" ]]   && PLIB_GIT_TRACKED_COLOR=10
  [[ -z "${PLIB_GIT_UNTRACKED_COLOR}" ]] && PLIB_GIT_UNTRACKED_COLOR=1
else
  if [[ "$AM_THEME" == 'MONO' ]]; then
    [[ -z "${PROMPT_START_TAG_COLOR}" ]] && PROMPT_START_TAG_COLOR=250
    [[ -z "${PROMPT_END_TAG_COLOR}" ]]   && PROMPT_END_TAG_COLOR=250

    [[ -z "${PLIB_GIT_TRACKED_COLOR}" ]]   && PLIB_GIT_TRACKED_COLOR=250
    [[ -z "${PLIB_GIT_UNTRACKED_COLOR}" ]] && PLIB_GIT_UNTRACKED_COLOR=246
  elif [[ "$AM_THEME" == 'MONO_BRIGHT' ]]; then
    [[ -z "${PROMPT_START_TAG_COLOR}" ]] && PROMPT_START_TAG_COLOR=255
    [[ -z "${PROMPT_END_TAG_COLOR}" ]]   && PROMPT_END_TAG_COLOR=255

    [[ -z "${PLIB_GIT_TRACKED_COLOR}" ]]   && PLIB_GIT_TRACKED_COLOR=255
    [[ -z "${PLIB_GIT_UNTRACKED_COLOR}" ]] && PLIB_GIT_UNTRACKED_COLOR=251
  else
    [[ -z "${PROMPT_START_TAG_COLOR}" ]] && PROMPT_START_TAG_COLOR=39
    [[ -z "${PROMPT_END_TAG_COLOR}" ]]   && PROMPT_END_TAG_COLOR=39

    [[ -z "${PLIB_GIT_TRACKED_COLOR}" ]]   && PLIB_GIT_TRACKED_COLOR=78
    [[ -z "${PLIB_GIT_UNTRACKED_COLOR}" ]] && PLIB_GIT_UNTRACKED_COLOR=208
  fi
fi
