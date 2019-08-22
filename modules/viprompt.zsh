#!/usr/bin/env zsh

am_prompt_symbol_ins(){
  [[ -z ${AM_VIM_INSERT_SYM} ]] && AM_VIM_INSERT_SYM='[I]';
  echo -ne "%B%F{$am_viins_color}${AM_VIM_INSERT_SYM}"
}

am_prompt_symbol_nml(){
  [[ -z ${AM_VIM_NORMAL_SYM} ]] && AM_VIM_NORMAL_SYM='[N]';
  echo -ne "%B%F{$am_vicmd_color}${AM_VIM_NORMAL_SYM}"
}

am_vim_prompt(){
  if [[ ${AM_ENABLE_VI_PROMPT} == 1 ]]; then
    echo -ne "${AM_VI_MODE_IND}"
  fi
}

am_update_vim_prompt() {
	AM_VI_MODE_IND=" ${${KEYMAP/vicmd/$(am_prompt_symbol_nml)}/(main|viins)/$(am_prompt_symbol_ins)}"
	zle && zle reset-prompt
}

if [[ ${AM_ENABLE_VI_PROMPT} == 1 ]]; then
  zle-line-init() {
    am_update_vim_prompt
  }
  zle-keymap-select() {
    am_update_vim_prompt
  }

  export KEYTIMEOUT=1
  zle -N zle-line-init
  zle -N zle-keymap-select
fi