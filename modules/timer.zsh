#!/usr/bin/env zsh

function am_timer_start(){
  if [[ ! -z "$AM_SHOW_PROCESS_TIME" ]]
  then
    am_timer=$SECONDS
  fi
}

function am_get_time_prompt(){
  if [[ -z "$AM_SHOW_PROCESS_TIME" ]]
  then
    echo -ne ""
  else
    if [[ "$am_preexec_executed" == "1" ]]
    then
      echo -ne " %F{$am_timer_color}$((SECONDS - am_timer))%f"
    else
      echo -ne " %F{$am_timer_color}0%f"
    fi
  fi
}

