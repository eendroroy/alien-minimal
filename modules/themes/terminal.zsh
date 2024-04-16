#!/usr/bin/env zsh

am_theme(){
  [[ -z ${AM_VCS_COLOR} ]]              && AM_VCS_COLOR=1
  [[ -z ${AM_SSH_COLOR} ]]              && AM_SSH_COLOR=11
  [[ -z ${AM_NORMAL_COLOR} ]]           && AM_NORMAL_COLOR=12
  [[ -z ${AM_ERROR_COLOR} ]]            && AM_ERROR_COLOR=1
  [[ -z ${AM_REV_COLOR} ]]              && AM_REV_COLOR=14
  [[ -z ${AM_BRANCH_COLOR} ]]           && AM_BRANCH_COLOR=10
  [[ -z ${AM_LEFT_RIGHT_COLOR} ]]       && AM_LEFT_RIGHT_COLOR=3
  [[ -z ${AM_STASH_COLOR} ]]            && AM_STASH_COLOR=${AM_LEFT_RIGHT_COLOR}
  [[ -z ${AM_BARE_COLOR} ]]             && AM_BARE_COLOR=${AM_LEFT_RIGHT_COLOR}
  [[ -z ${AM_COMMIT_SINCE_COLOR} ]]     && AM_COMMIT_SINCE_COLOR=6
  [[ -z ${AM_FADE_COLOR} ]]             && AM_FADE_COLOR=8
  [[ -z ${AM_VENV_COLOR} ]]             && AM_VENV_COLOR=8
  [[ -z ${AM_PYTHON_COLOR} ]]           && AM_PYTHON_COLOR=2
  [[ -z ${AM_RUBY_COLOR} ]]             && AM_RUBY_COLOR=1
  [[ -z ${AM_JAVA_COLOR} ]]             && AM_JAVA_COLOR=15
  [[ -z ${AM_GO_COLOR} ]]               && AM_GO_COLOR=6
  [[ -z ${AM_ELIXIR_COLOR} ]]           && AM_ELIXIR_COLOR=13
  [[ -z ${AM_CRYSTAL_COLOR} ]]          && AM_CRYSTAL_COLOR=8
  [[ -z ${AM_NODE_COLOR} ]]             && AM_NODE_COLOR=2
  [[ -z ${AM_PHP_COLOR} ]]              && AM_PHP_COLOR=5
  [[ -z ${AM_GRADLE_COLOR} ]]           && AM_GRADLE_COLOR=2
  [[ -z ${AM_TIMER_COLOR} ]]            && AM_TIMER_COLOR=14
  [[ -z ${AM_VIINS_COLOR} ]]            && AM_VIINS_COLOR=12
  [[ -z ${AM_VICMD_COLOR} ]]            && AM_VICMD_COLOR=1
  [[ -z ${AM_PROMPT_START_TAG_COLOR} ]] && AM_PROMPT_START_TAG_COLOR=12
  [[ -z ${AM_PROMPT_END_TAG_COLOR} ]]   && AM_PROMPT_END_TAG_COLOR=12
  [[ -z ${AM_GIT_TRACKED_COLOR} ]]      && AM_GIT_TRACKED_COLOR=10
  [[ -z ${AM_GIT_UN_TRACKED_COLOR} ]]   && AM_GIT_UN_TRACKED_COLOR=1
  [[ -z ${AM_LEFT_RIGHT_COLOR} ]]       && AM_LEFT_RIGHT_COLOR=15
}
