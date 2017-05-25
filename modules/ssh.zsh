#!/usr/bin/env zsh

am_ssh_st(){
  [[ -n "$SSH_CLIENT" ]] && echo -n "%F{$clean_ssh_color}[S] %f"
}
