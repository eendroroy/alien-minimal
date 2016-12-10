#!/usr/bin/env zsh

__color_man_page(){
  export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
  export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
  export LESS_TERMCAP_me=$(printf '\e[0m')     # turn off all appearance modes (mb, md, so, us)
  export LESS_TERMCAP_se=$(printf '\e[0m')     # leave standout mode
  export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
  export LESS_TERMCAP_ue=$(printf '\e[0m')     # leave underline mode
  export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan
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
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return false;
  echo "G: ${ref#refs/heads/}";
  return true;
}

_is_hg(){
  if [[ $(hg branch 2>/dev/null) != "" ]]; then echo 1 ; else echo 0 ; fi
}

_hg_branch() {
  ref=$(hg branch 2> /dev/null) || return true;
  echo "M: ${ref}";
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

  ssh=226
  normal=39
  error=208
  vcs=78
 
  setopt promptsubst
  PROMPT='%F{$ssh}`__ssh`%f%(?..%F{$error}%?|✘ %f)%F{$normal}%1~%f '
  RPROMPT='%F{$vcs}`_vcs_info`%f'
}

autoload -U add-zsh-hook
alien_min_prompt

