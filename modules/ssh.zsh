#!/usr/bin/env zsh

am_ssh_st(){
  [[ -n "$SSH_CLIENT" ]] && echo -n "%F{$am_ssh_color}[S] %f"
}
