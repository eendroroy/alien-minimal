#!/usr/bin/env zsh

am_java_version(){
  echo -ne "%F{$am_java_color}${AM_JAVA_SYM}`plib_java_major_version`%f"
}
