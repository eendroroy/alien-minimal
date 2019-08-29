#!/usr/bin/env zsh

# shellcheck disable=SC2034

r_prompt_completed(){
  RPROMPT=$(echo "${3}" | tr -s ' ')
  zle && zle reset-prompt
}

am_async_r_prompt(){
  __AM_ENVS="$(env | grep "ENV_VERSION=\|^VIRTUAL_ENV=\|^AM_")"
  async_init
  async_start_worker right_prompt -n
  async_register_callback right_prompt r_prompt_completed
  async_job right_prompt am_r_prompt_render "${PWD}" "${__AM_ENVS}" "${AM_VERSIONS_PROMPT}"
}

l_prompt_completed(){
  PROMPT=$(echo "${3}" | tr -s ' ')
  zle && zle reset-prompt
}

am_async_l_prompt(){
  __AM_ENVS="$(env | grep "ENV_VERSION=\|^VIRTUAL_ENV=\|^AM_")"
  async_init
  async_start_worker left_prompt -n
  async_register_callback left_prompt l_prompt_completed
  async_job left_prompt am_l_prompt_render "${PWD}" "${__AM_ENVS}"
}
