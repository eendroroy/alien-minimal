#!/usr/bin/env zsh

function am_dummy(){
}

am_async_prompt(){
  async_init
  async_start_worker prompt -n
  async_register_callback prompt am_prompt_complete
  async_job prompt ap_dummy
}
