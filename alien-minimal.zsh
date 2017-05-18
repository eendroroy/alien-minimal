#!/usr/bin/env bash

_zsh_terminal_set_256color() {
  if [[ "$TERM" =~ "-256color$" ]] ; then
    [[ -n "${ZSH_256COLOR_DEBUG}" ]] && echo -n "zsh-256color: 256 color terminal already set." >&2
    return
  fi

  local TERM256="${TERM}-256color"

  # Use (n-)curses binaries, if installed.
  if [[ -x "$( which toe )" ]] ; then
    if toe -a | egrep -q "^$TERM256" ; then
      _zsh_256color_debug "Found $TERM256 from (n-)curses binaries."
      export TERM="$TERM256"
      return
    fi
  fi

  # Search through termcap descriptions, if binaries are not installed.
  for termcaps in $TERMCAP "$HOME/.termcap" "/etc/termcap" "/etc/termcap.small" ; do
    if [[ -e "$termcaps" ]] && egrep -q "(^$TERM256|\|$TERM256)\|" "$termcaps" ; then
      _zsh_256color_debug "Found $TERM256 from $termcaps."
      export TERM="$TERM256"
      return
    fi
  done

  # Search through terminfo descriptions, if binaries are not installed.
  for terminfos in $TERMINFO "$HOME/.terminfo" "/etc/terminfo" "/lib/terminfo" "/usr/share/terminfo" ; do
    if [[ -e "$terminfos"/$TERM[1]/"$TERM256" || \
        -e "$terminfos"/"$TERM256" ]] ; then
      _zsh_256color_debug "Found $TERM256 from $terminfos."
      export TERM="$TERM256"
      return
    fi
  done
}

_colorize(){ _zsh_terminal_set_256color; unset -f _zsh_terminal_set_256color; }

_ssh_st(){ [[ -n "$SSH_CLIENT" ]] && echo -n "[S] "; }

_is_git(){ if [[ $(git branch 2>/dev/null) != "" ]]; then; echo 1 ; else; echo 0 ; fi; }
_git_branch(){ ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="detached" || return false; echo -n "${ref#refs/heads/}"; return true; }
_git_rev(){ rev=$(git rev-parse HEAD | cut -c 1-7); echo -n "${rev}"; return true; }

_git_dirty(){
  _mod=$(git status --porcelain 2>/dev/null | grep M | wc -l | tr -d ' ');
  _add=$(git status --porcelain 2>/dev/null | grep A | wc -l | tr -d ' ');
  _del=$(git status --porcelain 2>/dev/null | grep D | wc -l | tr -d ' ');
  _new=$(git status --porcelain 2>/dev/null | grep '??' | wc -l | tr -d ' ');
  [[ "$_mod" != "0" ]] && echo -n " ⭑";
  [[ "$_add" != "0" ]] && echo -n " +";
  [[ "$_del" != "0" ]] && echo -n " -";
  [[ "$_new" != "0" ]] && echo -n " ?";
}

_git_left_right(){
  if [[ $(_git_branch) != "detached" ]]; then
    _pull=$(git rev-list --left-right --count `_git_branch`...origin/`_git_branch` | awk '{print $2}' | tr -d ' ');
    _push=$(git rev-list --left-right --count `_git_branch`...origin/`_git_branch` | awk '{print $1}' | tr -d ' ');
    [[ "$_pull" != "0" ]] && echo -n " ▼";
    [[ "$_push" != "0" ]] && echo -n " ▲";
  else
    echo -n "";
  fi
}

_is_hg(){ if [[ $(hg branch 2>/dev/null) != "" ]]; then; echo 1 ; else; echo 0 ; fi; }
_hg_branch(){ ref=$(hg branch 2> /dev/null) || return false; echo -n "${ref}"; return true; }
_hg_rev(){ rev=$(hg identify --num | tr -d " +") || return false; echo -n "${rev}"; return true; }

_is_svn(){ if [[ $(svn info 2>/dev/null) != "" ]]; then; echo 1 ; else; echo 0 ; fi; }
_svn_rev(){ rev=$(svn info 2>/dev/null | grep Revision | awk '{print $2}') || return false; echo -n "${rev}"; return true; }

_set_r_prompt(){
  if [[ $(_is_git) == 1 ]]; then
    echo -ne "%F{$_normal}G%f %F{$_br}`_git_branch`%f%F{$_lr}`_git_left_right`%f %F{$_rev}`_git_rev`%f%F{$_dirty}`_git_dirty`%f"
  elif [[ $(_is_hg) == 1 ]]; then
  echo -ne "%F{$_normal}M%f %F{$_br}`_hg_branch`%f %F{$_rev}`_hg_rev`%f"
  elif [[ $(_is_svn) == 1 ]]; then
  echo -ne "%F{$_normal}G%f %F{$_rev}`_svn_rev`%f"
  fi
 }

alien_min_prompt(){
  _ssh=226
  _normal=039
  _error=208
  _rev=248
  _br=046
  _dirty=208
  _lr=226

  setopt prompt_subst
  PROMPT='%F{$_ssh}`_ssh_st`%f%(?..%F{$_error}%?|✘ %f)%F{$_normal}%1~%f '
  RPROMPT='`_set_r_prompt`'
}

_colorize()
autoload -U add-zsh-hook
alien_min_prompt
