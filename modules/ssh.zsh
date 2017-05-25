#!/usr/bin/env zsh

_ssh_st(){
  [[ -n "$SSH_CLIENT" ]] && echo -n "[S] "
}
