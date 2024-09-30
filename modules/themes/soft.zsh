#!/usr/bin/env zsh

am_theme(){
  [[ -z ${AM_VCS_COLOR} ]]              && AM_VCS_COLOR=248
  [[ -z ${AM_SSH_COLOR} ]]              && AM_SSH_COLOR=154
  [[ -z ${AM_NORMAL_COLOR} ]]           && AM_NORMAL_COLOR=81
  [[ -z ${AM_ERROR_COLOR} ]]            && AM_ERROR_COLOR=197
  [[ -z ${AM_REV_COLOR} ]]              && AM_REV_COLOR=74
  [[ -z ${AM_BRANCH_COLOR} ]]           && AM_BRANCH_COLOR=122
  [[ -z ${AM_LEFT_RIGHT_COLOR} ]]       && AM_LEFT_RIGHT_COLOR=226
  [[ -z ${AM_STASH_COLOR} ]]            && AM_STASH_COLOR=${AM_LEFT_RIGHT_COLOR}
  [[ -z ${AM_BARE_COLOR} ]]             && AM_BARE_COLOR=${AM_LEFT_RIGHT_COLOR}
  [[ -z ${AM_COMMIT_SINCE_COLOR} ]]     && AM_COMMIT_SINCE_COLOR=103
  [[ -z ${AM_FADE_COLOR} ]]             && AM_FADE_COLOR=242
  [[ -z ${AM_VENV_COLOR} ]]             && AM_VENV_COLOR=245
  [[ -z ${AM_PYTHON_COLOR} ]]           && AM_PYTHON_COLOR=40
  [[ -z ${AM_RUBY_COLOR} ]]             && AM_RUBY_COLOR=196
  [[ -z ${AM_JAVA_COLOR} ]]             && AM_JAVA_COLOR=178
  [[ -z ${AM_GO_COLOR} ]]               && AM_GO_COLOR=81
  [[ -z ${AM_ELIXIR_COLOR} ]]           && AM_ELIXIR_COLOR=99
  [[ -z ${AM_CRYSTAL_COLOR} ]]          && AM_CRYSTAL_COLOR=8
  [[ -z ${AM_NODE_COLOR} ]]             && AM_NODE_COLOR=41
  [[ -z ${AM_PHP_COLOR} ]]              && AM_PHP_COLOR=57
  [[ -z ${AM_GRADLE_COLOR} ]]           && AM_GRADLE_COLOR=64
  [[ -z ${AM_MAVEN_COLOR} ]]            && AM_MAVEN_COLOR=161
  [[ -z ${AM_TIMER_COLOR} ]]            && AM_TIMER_COLOR=248
  [[ -z ${AM_PROMPT_START_TAG_COLOR} ]] && AM_PROMPT_START_TAG_COLOR=12
  [[ -z ${AM_PROMPT_END_TAG_COLOR} ]]   && AM_PROMPT_END_TAG_COLOR=12
  [[ -z ${AM_GIT_TRACKED_COLOR} ]]      && AM_GIT_TRACKED_COLOR=122
  [[ -z ${AM_GIT_UN_TRACKED_COLOR} ]]   && AM_GIT_UN_TRACKED_COLOR=181
  [[ -z ${AM_LEFT_RIGHT_COLOR} ]]       && AM_LEFT_RIGHT_COLOR=254
}
