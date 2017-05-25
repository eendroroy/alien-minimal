#!/usr/bin/env zsh

_bg_count() {
  _jobc="`jobs | wc -l | tr -d ' '`";
  if [[ "$_jobc" != 0 ]]; then
    echo -ne " [$_jobc]"
  fi
}