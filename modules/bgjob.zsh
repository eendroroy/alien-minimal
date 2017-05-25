#!/usr/bin/env zsh

am_bg_count() {
  _jobc="`jobs | grep -v "pwd" | wc -l | tr -d ' '`";
  if [[ "$_jobc" != 0 ]]; then
    echo -ne "%F{$clean_fade_color}[$_jobc]%f "
  fi
  unset _jobc
}