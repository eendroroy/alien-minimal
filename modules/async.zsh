#!/usr/bin/env zsh

prompt_completed(){
  # shellcheck disable=SC2034
  RPROMPT=$3
  zle && zle reset-prompt
}

am_async_prompt(){
  async_init
  async_start_worker prompt -n
  async_register_callback prompt prompt_completed
  async_job prompt am_prompt_complete "$(pwd)" "${AM_VERSIONS_PROMPT}"
}
