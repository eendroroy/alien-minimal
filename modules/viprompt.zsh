#!/usr/bin/env zsh

# shellcheck disable=SC2034

am_prompt_symbol_ins(){
  echo -ne "%B%F{$AM_VIINS_COLOR}${AM_VIM_INSERT_SYM}%f%b"
}

am_prompt_symbol_nml(){
  echo -ne "%B%F{$AM_VICMD_COLOR}${AM_VIM_NORMAL_SYM}%f%b"
}

am_get_vi_mode(){
  case "${KEYMAP}" in
    vicmd)
      echo -n "$(am_prompt_symbol_nml)"
      ;;
    main|viins)
      echo -n "$(am_prompt_symbol_ins)"
      ;;
  esac
}

am_render_vi_mode(){
  AM_VI_PROMPT_VAL="$(am_get_vi_mode)"
  export AM_VI_PROMPT_VAL
}

function zle-line-init {
  am_render_vi_mode
  zle && zle reset-prompt
}
function zle-keymap-select {
  am_render_vi_mode
  zle && zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1
