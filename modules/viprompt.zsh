#!/usr/bin/env zsh

am_vi_prompt() {
  echo -ne "${AM_VI_PROMPT_VAL}"
}

__render_vi_prompt() {
  case "${KEYMAP}" in
    vicmd)
      AM_VI_PROMPT_VAL="%B%F{$AM_VI_NORMAL_COLOR}${AM_VIM_NORMAL_SYM}%f%b"
      ;;
    main|viins)
      AM_VI_PROMPT_VAL="%B%F{$AM_VI_INSERT_COLOR}${AM_VIM_INSERT_SYM}%f%b"
      ;;
  esac
  precmd
  zle && zle reset-prompt
}

zle-line-init() {
  __render_vi_prompt
}

zle-keymap-select() {
  __render_vi_prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
