#!/usr/bin/env zsh

VIM_PROMPT=""
am_update_vim_prompt() {
	zle || {
	    print "error: pure_update_vim_prompt must be called when zle is active"
	    return 1
	}
	[[ -z $VIM_INSERT ]] && VIM_INSERT='%B%F{$am_normal_color}[I]'
	[[ -z $VIM_NORMAL ]] && VIM_NORMAL='%B%F{$am_error_color}[N]'
	VIM_PROMPT=" ${${KEYMAP/vicmd/${VIM_NORMAL}}/(main|viins)/${VIM_INSERT}}%b%f"
	zle .reset-prompt
}

function zle-line-init zle-keymap-select {
	am_update_vim_prompt
}
export KEYTIMEOUT=1
zle -N zle-line-init
zle -N zle-keymap-select
