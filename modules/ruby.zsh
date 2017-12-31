#!/usr/bin/env zsh

am_ruby_version(){
  echo -ne "%F{$am_ruby_color}${AM_RB_SYM}`plib_ruby_short_version`%f"
}
