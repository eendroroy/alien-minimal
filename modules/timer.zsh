#!/usr/bin/env zsh

function am_timer_start(){
  if [[ -n ${AM_SHOW_PROCESS_TIME} ]]
  then
    am_timer=${SECONDS}
  fi
}

function am_get_time_prompt(){
  if [[ -z ${AM_SHOW_PROCESS_TIME} ]] || [[ ${AM_SHOW_PROCESS_TIME} == 0 ]]; then
    echo -ne ""
  else
    if [[ ${am_preexec_executed} == "1" ]]; then
      __seconds=$((SECONDS - am_timer))
    else
      __seconds=0
    fi
    if [[ ${AM_SHOW_PROCESS_TIME} == 1 ]] || { [[ ${AM_SHOW_PROCESS_TIME} == 2 ]] && [[ ${__seconds} != 0 ]]; }; then
      echo -ne "%F{$am_timer_color}${__seconds}%f"
    else
      echo -ne ""
    fi
  fi
}
