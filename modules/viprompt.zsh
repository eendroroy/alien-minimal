#!/usr/bin/env zsh

am_prompt_symbol_ins(){
  [[ -z ${VIM_INSERT_SYM} ]] && VIM_INSERT_SYM='[I]';
  echo -ne "%B%F{$am_viins_color}${VIM_INSERT_SYM}"
}

am_prompt_symbol_nml(){
  [[ -z ${VIM_NORMAL_SYM} ]] && VIM_NORMAL_SYM='[N]';
  echo -ne "%B%F{$am_vicmd_color}${VIM_NORMAL_SYM}"
}

am_vim_prompt(){
  if [[ ${AM_ENABLE_VI_PROMPT} == 1 ]]; then
    echo -n " ${${KEYMAP/vicmd/`am_prompt_symbol_nml`}/(main|viins)/`am_prompt_symbol_ins`}"
  fi
}