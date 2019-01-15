#!/usr/bin/env zsh

am_prompt_symbol_ins() {
  [[ -z ${VIM_INSERT_SYM} ]] && VIM_INSERT_SYM='[I]';
  echo -ne "%B%F{$am_viins_color}${VIM_INSERT_SYM}"
}

am_prompt_symbol_nml() {
  [[ -z ${VIM_NORMAL_SYM} ]] && VIM_NORMAL_SYM='[N]';
  echo -ne "%B%F{$am_vicmd_color}${VIM_NORMAL_SYM}"
}

am_update_vim_prompt() {
	zle || {
	    print "error: am_update_vim_prompt must be called when zle is active"
	    return 1
	}
	
	[[ -z ${VIM_NORMAL} ]] && VIM_NORMAL='%B%F{$am_error_color}[N]'
	VIM_PROMPT=" ${${KEYMAP/vicmd/`am_prompt_symbol_nml`}/(main|viins)/`am_prompt_symbol_ins`}"
	zle .reset-prompt
}

function zle-line-init zle-keymap-select {
	am_update_vim_prompt
}

export KEYTIMEOUT=1
zle -N zle-line-init
zle -N zle-keymap-select
