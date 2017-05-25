#!/usr/bin/env zsh

_is_git(){
  if [[ $(\git branch 2>/dev/null) != "" ]]; then
    echo 1
  else
    echo 0
  fi
}

_git_branch(){
  ref=$(\git symbolic-ref HEAD 2> /dev/null) || ref="detached" || return;
  echo -n "${ref#refs/heads/}";
}

_git_rev(){
  rev=$(\git rev-parse HEAD | cut -c 1-7);
  echo -n "${rev}";
}

_git_dirty(){
  _mod=$(\git status --porcelain 2>/dev/null | grep 'M ' | wc -l | tr -d ' ');
  _add=$(\git status --porcelain 2>/dev/null | grep 'A ' | wc -l | tr -d ' ');
  _del=$(\git status --porcelain 2>/dev/null | grep 'D ' | wc -l | tr -d ' ');
  _new=$(\git status --porcelain 2>/dev/null | grep '?? ' | wc -l | tr -d ' ');
  [[ "$_mod" != "0" ]] && echo -n " ⭑";
  [[ "$_add" != "0" ]] && echo -n " +";
  [[ "$_del" != "0" ]] && echo -n " -";
  [[ "$_new" != "0" ]] && echo -n " ?";

  unset _mod _new _add _del
}

_git_left_right(){
  if [[ $(_git_branch) != "detached" ]]; then
    _pull=$(\git rev-list --left-right --count `_git_branch`...origin/`_git_branch` 2>/dev/null | awk '{print $2}' | tr -d ' \n');
    _push=$(\git rev-list --left-right --count `_git_branch`...origin/`_git_branch` 2>/dev/null | awk '{print $1}' | tr -d ' \n');
    [[ "$_pull" != "0" ]] && [[ "$_pull" != "" ]] && echo -n " ▼";
    [[ "$_push" != "0" ]] && [[ "$_push" != "" ]] && echo -n " ▲";

    unset _pull _push
  else
    echo -n "";
  fi
}