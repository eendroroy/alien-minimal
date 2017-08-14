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
