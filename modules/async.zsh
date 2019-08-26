#!/usr/bin/env zsh

# shellcheck disable=SC2034

r_prompt_completed(){
  RPROMPT=$(echo "${3}" | tr -s ' ')
  zle && zle reset-prompt
}

am_async_r_prompt(){
  async_init
  async_start_worker right_prompt -n
  async_register_callback right_prompt r_prompt_completed
  async_job right_prompt am_r_prompt_complete "$(pwd)" "${VIRTUAL_ENV}" "${SSH_CLIENT}" "${AM_VERSIONS_PROMPT}"
}

l_prompt_completed(){
  PROMPT=$(echo "${3}" | tr -s ' ')
  zle && zle reset-prompt
}

am_async_l_prompt(){
  async_init
  async_start_worker left_prompt -n
  async_register_callback left_prompt l_prompt_completed
  async_job left_prompt am_l_prompt_complete  "$(pwd)" "${VIRTUAL_ENV}" "${SSH_CLIENT}"
}