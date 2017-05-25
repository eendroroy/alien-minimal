#!/usr/bin/env zsh

cp_bg_count() {
  _jobc="`jobs | wc -l | tr -d ' '`";
  if [[ "$_jobc" != 0 ]]; then
    echo -ne "%F{$clean_fade_color} [$_jobc]%f"
  fi
  unset _jobc
}