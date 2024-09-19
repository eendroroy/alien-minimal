#!/usr/bin/env zsh

am_theme(){
  [[ -z ${AM_VCS_COLOR} ]]              && AM_VCS_COLOR=#A0A0A0
  [[ -z ${AM_SSH_COLOR} ]]              && AM_SSH_COLOR=#E6C242
  [[ -z ${AM_NORMAL_COLOR} ]]           && AM_NORMAL_COLOR=#88C0D0
  [[ -z ${AM_ERROR_COLOR} ]]            && AM_ERROR_COLOR=#BF616A
  [[ -z ${AM_REV_COLOR} ]]              && AM_REV_COLOR=#B48EAD
  [[ -z ${AM_BRANCH_COLOR} ]]           && AM_BRANCH_COLOR=#8CBA86
  [[ -z ${AM_LEFT_RIGHT_COLOR} ]]       && AM_LEFT_RIGHT_COLOR=#EACB8A
  [[ -z ${AM_STASH_COLOR} ]]            && AM_STASH_COLOR=${AM_LEFT_RIGHT_COLOR}
  [[ -z ${AM_BARE_COLOR} ]]             && AM_BARE_COLOR=${AM_LEFT_RIGHT_COLOR}
  [[ -z ${AM_COMMIT_SINCE_COLOR} ]]     && AM_COMMIT_SINCE_COLOR=#A5A5A5
  [[ -z ${AM_FADE_COLOR} ]]             && AM_FADE_COLOR=#4C566B
  [[ -z ${AM_VENV_COLOR} ]]             && AM_VENV_COLOR=#C8AE48
  [[ -z ${AM_PYTHON_COLOR} ]]           && AM_PYTHON_COLOR=#3570A1
  [[ -z ${AM_RUBY_COLOR} ]]             && AM_RUBY_COLOR=#FF6665
  [[ -z ${AM_JAVA_COLOR} ]]             && AM_JAVA_COLOR=#FEBB6F
  [[ -z ${AM_GO_COLOR} ]]               && AM_GO_COLOR=#76E1FE
  [[ -z ${AM_ELIXIR_COLOR} ]]           && AM_ELIXIR_COLOR=#432459
  [[ -z ${AM_CRYSTAL_COLOR} ]]          && AM_CRYSTAL_COLOR=#010101
  [[ -z ${AM_NODE_COLOR} ]]             && AM_NODE_COLOR=#79B264
  [[ -z ${AM_PHP_COLOR} ]]              && AM_PHP_COLOR=#7277AE
  [[ -z ${AM_GRADLE_COLOR} ]]           && AM_GRADLE_COLOR=#1E9BC4
  [[ -z ${AM_MAVEN_COLOR} ]]            && AM_MAVEN_COLOR=#D74330
  [[ -z ${AM_TIMER_COLOR} ]]            && AM_TIMER_COLOR=#B48EAD
  [[ -z ${AM_VIINS_COLOR} ]]            && AM_VIINS_COLOR=208
  [[ -z ${AM_VICMD_COLOR} ]]            && AM_VICMD_COLOR=193
  [[ -z ${AM_PROMPT_START_TAG_COLOR} ]] && AM_PROMPT_START_TAG_COLOR=#88C0D0
  [[ -z ${AM_PROMPT_END_TAG_COLOR} ]]   && AM_PROMPT_END_TAG_COLOR=#88C0D0
  [[ -z ${AM_GIT_TRACKED_COLOR} ]]      && AM_GIT_TRACKED_COLOR=#89BB9D
  [[ -z ${AM_GIT_UN_TRACKED_COLOR} ]]   && AM_GIT_UN_TRACKED_COLOR=#BA8888
}
