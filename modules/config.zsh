#!/usr/bin/env zsh

function configure(){
  if [[ -z "${PROMPT_START_TAG}" ]]
  then
    PROMPT_START_TAG=''
  fi

  if [[ -z "${PROMPT_END_TAG}" ]]
  then
    PROMPT_END_TAG=''
  fi

  if [[ -z "${PROMPT_START_TAG_COLOR}" ]]
  then
    PROMPT_START_TAG_COLOR=81
  fi

  if [[ -z "${PROMPT_END_TAG_COLOR}" ]]
  then
    PROMPT_END_TAG_COLOR=81
  fi
}

version_prompt(){
  if [[ ! -z "$AM_VERSIONS_PROMPT" ]]
  then
    LOOP_INDEX=0
    for _v in $AM_VERSIONS_PROMPT
    do
      [ "$LOOP_INDEX" != "0" ] && echo -ne "%F{$am_fade_color}|%f"
      [ "$LOOP_INDEX" = "0" ] && LOOP_INDEX=$(($LOOP_INDEX + 1)) && echo -ne "%F{$am_fade_color}[%f"
      [ "$_v" = "PYTHON" ] && echo -ne "`am_python_version`"
      [ "$_v" = "RUBY" ] && echo -ne "`am_ruby_version`"
    done
    [ "$LOOP_INDEX" != "0" ] && echo -ne "%F{$am_fade_color}]%f"
  fi
}
