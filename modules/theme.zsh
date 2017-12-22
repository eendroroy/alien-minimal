#!/usr/bin/env zsh

am_load_terminal_colors(){
  [[ -z $am_vcs_color ]]          && am_vcs_color=1
  [[ -z $am_ssh_color ]]          && am_ssh_color=11
  [[ -z $am_normal_color ]]       && am_normal_color=12
  [[ -z $am_error_color ]]        && am_error_color=1
  [[ -z $am_rev_color ]]          && am_rev_color=14
  [[ -z $am_branch_color ]]       && am_branch_color=10
  [[ -z $am_left_right_color ]]   && am_left_right_color=3
  [[ -z $am_commit_since_color ]] && am_commit_since_color=6
  [[ -z $am_fade_color ]]         && am_fade_color=8
  [[ -z $am_venv_color ]]         && am_venv_color=8
  [[ -z $am_python_color ]]       && am_python_color=2
  [[ -z $am_ruby_color ]]         && am_ruby_color=1
  [[ -z $am_java_color ]]         && am_java_color=15
  [[ -z $am_timer_color ]]        && am_timer_color=14
}

am_load_mono_theme(){
  [[ -z $am_vcs_color ]]          && am_vcs_color=242
  [[ -z $am_ssh_color ]]          && am_ssh_color=244
  [[ -z $am_normal_color ]]       && am_normal_color=250
  [[ -z $am_error_color ]]        && am_error_color=250
  [[ -z $am_rev_color ]]          && am_rev_color=240
  [[ -z $am_branch_color ]]       && am_branch_color=246
  [[ -z $am_left_right_color ]]   && am_left_right_color=255
  [[ -z $am_commit_since_color ]] && am_commit_since_color=242
  [[ -z $am_fade_color ]]         && am_fade_color=242
  [[ -z $am_venv_color ]]         && am_venv_color=246
  [[ -z $am_python_color ]]       && am_python_color=243
  [[ -z $am_ruby_color ]]         && am_ruby_color=240
  [[ -z $am_java_color ]]         && am_java_color=247
  [[ -z $am_timer_color ]]        && am_timer_color=242
}

am_load_mono_bright_theme(){
  [[ -z $am_vcs_color ]]          && am_vcs_color=247
  [[ -z $am_ssh_color ]]          && am_ssh_color=249
  [[ -z $am_normal_color ]]       && am_normal_color=255
  [[ -z $am_error_color ]]        && am_error_color=255
  [[ -z $am_rev_color ]]          && am_rev_color=245
  [[ -z $am_branch_color ]]       && am_branch_color=251
  [[ -z $am_left_right_color ]]   && am_left_right_color=255
  [[ -z $am_commit_since_color ]] && am_commit_since_color=247
  [[ -z $am_fade_color ]]         && am_fade_color=247
  [[ -z $am_venv_color ]]         && am_venv_color=251
  [[ -z $am_python_color ]]       && am_python_color=248
  [[ -z $am_ruby_color ]]         && am_ruby_color=245
  [[ -z $am_java_color ]]         && am_java_color=252
  [[ -z $am_timer_color ]]        && am_timer_color=247
}

am_load_default_theme(){
  [[ -z $am_vcs_color ]]          && am_vcs_color=248
  [[ -z $am_ssh_color ]]          && am_ssh_color=226
  [[ -z $am_normal_color ]]       && am_normal_color=39
  [[ -z $am_error_color ]]        && am_error_color=208
  [[ -z $am_rev_color ]]          && am_rev_color=248
  [[ -z $am_branch_color ]]       && am_branch_color=78
  [[ -z $am_left_right_color ]]   && am_left_right_color=222
  [[ -z $am_commit_since_color ]] && am_commit_since_color=244
  [[ -z $am_fade_color ]]         && am_fade_color=242
  [[ -z $am_venv_color ]]         && am_venv_color=245
  [[ -z $am_python_color ]]       && am_python_color=40
  [[ -z $am_ruby_color ]]         && am_ruby_color=196
  [[ -z $am_java_color ]]         && am_java_color=178
  [[ -z $am_timer_color ]]        && am_timer_color=248
}

am_load_colors(){
  if [[ "$AM_USE_TERMINAL_COLOR" == "1" ]]; then
    am_load_terminal_colors
  else
    [[ -z "$AM_THEME" ]] && AM_THEME='DEFAULT'
    if [[ "$AM_THEME" == 'MONO' ]]; then
      am_load_mono_theme
    elif [[ "$AM_THEME" == 'MONO_BRIGHT' ]]; then
      am_load_mono_bright_theme
    elif [[ "$AM_THEME" == 'DEFAULT' ]]; then
      am_load_default_theme
    fi
  fi
}

