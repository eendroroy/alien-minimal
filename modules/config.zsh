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
  if [[ -v AM_VERSIONS_PROMPT ]]
  then
    LOOP_INDEX=0
    for _v in $AM_VERSIONS_PROMPT
    do
      [ "$LOOP_INDEX" != "0" ] && echo -ne "|"
	  [ "$LOOP_INDEX" = "0" ] && LOOP_INDEX=$(($LOOP_INDEX + 1)) && echo -ne " "
      [ "$_v" = "PYTHON" ] && echo -ne "`am_python_version`"
      [ "$_v" = "PYTHON_MAJOR" ] && echo -ne "`am_python_major_version`"
      [ "$_v" = "PYTHON_MAJOR_MINOR" ] && echo -ne "`am_python_major_minor_version`"
    done
  fi
}
