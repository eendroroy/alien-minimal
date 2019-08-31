#!/usr/bin/env zsh

# shellcheck disable=SC2034

am_prompt_symbol_ins(){
  echo -ne "%B%F{$am_viins_color}${AM_VIM_INSERT_SYM}"
}

am_prompt_symbol_nml(){
  echo -ne "%B%F{$am_vicmd_color}${AM_VIM_NORMAL_SYM}"
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

function zle-line-init {
  __AM_ENVS="$(env | grep --color=never "ENV_VERSION=\|^VIRTUAL_ENV=\|^AM_")"
  PROMPT="$(echo "$(am_get_vi_mode) $(am_l_prompt_render "${PWD}" "${__AM_ENVS}")" | tr -s ' ')"
  zle && zle reset-prompt
}
function zle-keymap-select {
  __AM_ENVS="$(env | grep --color=never "ENV_VERSION=\|^VIRTUAL_ENV=\|^AM_")"
  PROMPT="$(echo "$(am_get_vi_mode) $(am_l_prompt_render "${PWD}" "${__AM_ENVS}")" | tr -s ' ')"
  zle && zle reset-prompt
}

bindkey -v

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1
