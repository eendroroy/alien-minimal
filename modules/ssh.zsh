#!/usr/bin/env zsh

cp_ssh_st(){
  [[ -n "$SSH_CLIENT" ]] && echo -n "%F{$clean_ssh_color}[S] %f"
}
