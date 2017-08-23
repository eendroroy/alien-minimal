#!/usr/bin/env zsh

function am_dummy(){
}

am_async_r_prompt(){
  async_init
  async_start_worker rprompt -n
  async_register_callback rprompt am_rprompt_complete
  async_job rprompt ap_dummy
}

am_async_l_prompt(){
  async_init
  async_start_worker lprompt -n
  async_register_callback lprompt am_lprompt_complete
  async_job lprompt ap_dummy
}

