#!/usr/bin/env zsh

# shellcheck disable=SC2034
[[ -z "${AM_DIR_EXPANSION_LEVEL}" ]] && AM_DIR_EXPANSION_LEVEL=1

[[ -z "${AM_GIT_STASH_SYM}" ]]       && AM_GIT_STASH_SYM='@'
[[ -z "${AM_GIT_BARE_SYM}" ]]        && AM_GIT_BARE_SYM='☢'

[[ -z "${AM_VERSION_PROMPT_SEP}" ]]  && AM_VERSION_PROMPT_SEP='|'

[[ -z "${AM_PROMPT_START_TAG}" ]]    && AM_PROMPT_START_TAG='_'
[[ -z "${AM_PROMPT_END_TAG}" ]]      && AM_PROMPT_END_TAG='$'

if [[ ${AM_USE_NERD_FONT} = 1 ]]; then
  [[ -z "${AM_GIT_SYM}" ]]           && AM_GIT_SYM='󰊢'
  [[ -z "${AM_HG_SYM}" ]]            && AM_HG_SYM=' '
  [[ -z "${AM_SSH_SYM}" ]]           && AM_SSH_SYM=' '

  [[ -z "${AM_JAVA_SYM}" ]]          && AM_JAVA_SYM='󰬷 '
  [[ -z "${AM_PY_SYM}" ]]            && AM_PY_SYM=' '
  [[ -z "${AM_RB_SYM}" ]]            && AM_RB_SYM=' '
  [[ -z "${AM_GO_SYM}" ]]            && AM_GO_SYM='󰟓 '
  [[ -z "${AM_ELIXIR_SYM}" ]]        && AM_ELIXIR_SYM=' '
  [[ -z "${AM_CRYSTAL_SYM}" ]]       && AM_CRYSTAL_SYM=' '
  [[ -z "${AM_NODE_SYM}" ]]          && AM_NODE_SYM='󰎙 '
  [[ -z "${AM_PHP_SYM}" ]]           && AM_PHP_SYM=' '
  [[ -z "${AM_GRADLE_SYM}" ]]        && AM_GRADLE_SYM=' '
  [[ -z "${AM_MAVEN_SYM}" ]]         && AM_MAVEN_SYM=' '

  [[ -z "${AM_GIT_ADD_SYM}" ]]       && AM_GIT_ADD_SYM=''
  [[ -z "${AM_GIT_DEL_SYM}" ]]       && AM_GIT_DEL_SYM=''
  [[ -z "${AM_GIT_MOD_SYM}" ]]       && AM_GIT_MOD_SYM=''
  [[ -z "${AM_GIT_NEW_SYM}" ]]       && AM_GIT_NEW_SYM=''
  [[ -z "${AM_GIT_PUSH_SYM}" ]]      && AM_GIT_PUSH_SYM=''
  [[ -z "${AM_GIT_PULL_SYM}" ]]      && AM_GIT_PULL_SYM=''
else
  [[ -z "${AM_GIT_SYM}" ]]             && AM_GIT_SYM='G'
  [[ -z "${AM_HG_SYM}" ]]              && AM_HG_SYM='H'
  [[ -z "${AM_SVN_SYM}" ]]             && AM_SVN_SYM='S'
  [[ -z "${AM_SSH_SYM}" ]]             && AM_SSH_SYM='[S]'

  [[ -z "${AM_JAVA_SYM}" ]]            && AM_JAVA_SYM='JAVA:'
  [[ -z "${AM_PY_SYM}" ]]              && AM_PY_SYM='PY:'
  [[ -z "${AM_RB_SYM}" ]]              && AM_RB_SYM='RB:'
  [[ -z "${AM_GO_SYM}" ]]              && AM_GO_SYM='GO:'
  [[ -z "${AM_ELIXIR_SYM}" ]]          && AM_ELIXIR_SYM='EX:'
  [[ -z "${AM_CRYSTAL_SYM}" ]]         && AM_CRYSTAL_SYM='CR:'
  [[ -z "${AM_NODE_SYM}" ]]            && AM_NODE_SYM='NODE:'
  [[ -z "${AM_PHP_SYM}" ]]             && AM_PHP_SYM='PHP:'
  [[ -z "${AM_GRADLE_SYM}" ]]          && AM_GRADLE_SYM='GRADLE:'
  [[ -z "${AM_MAVEN_SYM}" ]]           && AM_MAVEN_SYM='MVN:'

  [[ -z "${AM_GIT_REBASING_SYMBOL}" ]] && AM_GIT_REBASING_SYMBOL='⇋'
  [[ -z "${AM_GIT_PUSH_SYM}" ]]        && AM_GIT_PUSH_SYM='↑'
  [[ -z "${AM_GIT_PULL_SYM}" ]]        && AM_GIT_PULL_SYM='↓'
  [[ -z "${AM_LEFT_RIGHT_SEP}" ]]      && AM_LEFT_RIGHT_SEP='|'
fi
