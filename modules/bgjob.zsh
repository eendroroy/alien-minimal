#!/usr/bin/env zsh

am_bg_count() {
  BG_COUNT=$(plib_bg_count)
  if [[ "$BG_COUNT" -gt 0 ]]; then
    echo -ne "%F{$am_fade_color}[$BG_COUNT]%f"
  fi
}
