#!/usr/bin/env zsh

_zsh_terminal_set_256color() {
  if [[ "$TERM" =~ "-256color$" ]] ; then
    [[ -n "${ZSH_256COLOR_DEBUG}" ]] && echo "zsh-256color: 256 color terminal already set." >&2
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

_colorize(){
  _zsh_terminal_set_256color
  unset -f _zsh_terminal_set_256color
}

_is_svn(){
  if [[ $(svn info 2>/dev/null) != "" ]]; then echo 1 ; else echo 0 ; fi
}

_svn_branch() {
  ref=$(svn info 2>/dev/null | grep Revision | awk '{print $2}') || return false;
  echo "S:@ ${ref}";
  return true;
}

_is_git(){
  if [[ $(git branch 2>/dev/null) != "" ]]; then echo 1 ; else echo 0 ; fi
}

_git_branch() {
  ref=$(git name-rev --name-only HEAD 2> /dev/null) || \
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return false;
  rev=$(git rev-parse HEAD | cut -c 1-7)
  echo "G: ${ref#refs/heads/} @${rev}";
  return true;
}

_is_hg(){
  if [[ $(hg branch 2>/dev/null) != "" ]]; then echo 1 ; else echo 0 ; fi
}

_hg_branch() {
  ref=$(hg branch 2> /dev/null) || return true;
  rev=$(hg identify --num | tr -d " +")
  echo "M: ${ref} @${rev}";
  return true;
}

_vcs_info(){
  if [[ $(_is_git) == 1 ]]; then
    _git_branch;
  elif [[ $(_is_hg) == 1 ]]; then
    _hg_branch;
  elif [[ $(_is_svn) == 1 ]]; then
    _svn_branch;
  else
    echo "";
  fi
}

__ssh(){
  if [ -n "$SSH_CLIENT" ]; then
    echo "[S] ";
  fi
}

alien_min_prompt(){
  _ssh=226
  _normal=039
  _error=208
  _vcs=046
 
  setopt promptsubst
  PROMPT='%F{$_ssh}`__ssh`%f%(?..%F{$_error}%?|✘ %f)%F{$_normal}%1~%f '
  RPROMPT='%F{$_vcs}`_vcs_info`%f'
}

_colorize()
autoload -U add-zsh-hook
alien_min_prompt

