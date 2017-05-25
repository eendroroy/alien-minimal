#!/usr/bin/env zsh

cp_is_git(){
  if [[ $(\git branch 2>/dev/null) != "" ]]; then
    echo 1
  else
    echo 0
  fi
}

cp_git_branch(){
  ref=$(\git symbolic-ref HEAD 2> /dev/null) || ref="detached" || return;
  echo -ne "%F{$clean_branch_color}${ref#refs/heads/}%f";
}

cp_git_rev(){
  rev=$(\git rev-parse HEAD | cut -c 1-7);
  echo -n "%F{$clean_rev_color}${rev}%f";
}

cp_git_dirty(){
  _mod=$(\git status --porcelain 2>/dev/null | grep 'M ' | wc -l | tr -d ' ');
  _add=$(\git status --porcelain 2>/dev/null | grep 'A ' | wc -l | tr -d ' ');
  _del=$(\git status --porcelain 2>/dev/null | grep 'D ' | wc -l | tr -d ' ');
  _new=$(\git status --porcelain 2>/dev/null | grep '?? ' | wc -l | tr -d ' ');
  [[ "$_mod" != "0" ]] && echo -n "%F{$clean_dirty_color} ⭑%f";
  [[ "$_add" != "0" ]] && echo -n "%F{$clean_dirty_color} +%f";
  [[ "$_del" != "0" ]] && echo -n "%F{$clean_dirty_color} -%f";
  [[ "$_new" != "0" ]] && echo -n "%F{$clean_dirty_color} ?%f";

  unset _mod _new _add _del
}

cp_git_left_right(){
  function _branch(){
    ref=$(\git symbolic-ref HEAD 2> /dev/null) || ref="detached" || return;
    echo -ne "${ref#refs/heads/}";
  }
  if [[ $(cp_git_branch) != "detached" ]]; then
    _pull=$(\git rev-list --left-right --count `_branch`...origin/`_branch` 2>/dev/null | awk '{print $2}' | tr -d ' \n');
    _push=$(\git rev-list --left-right --count `_branch`...origin/`_branch` 2>/dev/null | awk '{print $1}' | tr -d ' \n');
    [[ "$_pull" != "0" ]] && [[ "$_pull" != "" ]] && echo -n "%F{$clean_left_right_color} ▼%f";
    [[ "$_push" != "0" ]] && [[ "$_push" != "" ]] && echo -n "%F{$clean_left_right_color} ▲%f";

    unset _pull _push _branch
  else
    echo -n "sdfsd";
  fi
}