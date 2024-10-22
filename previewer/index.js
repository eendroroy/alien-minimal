function updateTheme() {
    var AM_VCS_COLOR = document.getElementById("AM_VCS_COLOR").value;
    var AM_SSH_COLOR = document.getElementById("AM_SSH_COLOR").value;
    var AM_NORMAL_COLOR = document.getElementById("AM_NORMAL_COLOR").value;
    var AM_ERROR_COLOR = document.getElementById("AM_ERROR_COLOR").value;
    var AM_REV_COLOR = document.getElementById("AM_REV_COLOR").value;
    var AM_BRANCH_COLOR = document.getElementById("AM_BRANCH_COLOR").value;
    var AM_LEFT_RIGHT_COLOR = document.getElementById("AM_LEFT_RIGHT_COLOR").value;
    var AM_STASH_COLOR = document.getElementById("AM_STASH_COLOR").value;
    var AM_BARE_COLOR = document.getElementById("AM_BARE_COLOR").value;
    var AM_COMMIT_SINCE_COLOR = document.getElementById("AM_COMMIT_SINCE_COLOR").value;
    var AM_FADE_COLOR = document.getElementById("AM_FADE_COLOR").value;
    var AM_VENV_COLOR = document.getElementById("AM_VENV_COLOR").value;
    var AM_PYTHON_COLOR = document.getElementById("AM_PYTHON_COLOR").value;
    var AM_RUBY_COLOR = document.getElementById("AM_RUBY_COLOR").value;
    var AM_JAVA_COLOR = document.getElementById("AM_JAVA_COLOR").value;
    var AM_GO_COLOR = document.getElementById("AM_GO_COLOR").value;
    var AM_ELIXIR_COLOR = document.getElementById("AM_ELIXIR_COLOR").value;
    var AM_CRYSTAL_COLOR = document.getElementById("AM_CRYSTAL_COLOR").value;
    var AM_NODE_COLOR = document.getElementById("AM_NODE_COLOR").value;
    var AM_PHP_COLOR = document.getElementById("AM_PHP_COLOR").value;
    var AM_GRADLE_COLOR = document.getElementById("AM_GRADLE_COLOR").value;
    var AM_MAVEN_COLOR = document.getElementById("AM_MAVEN_COLOR").value;
    var AM_TIMER_COLOR = document.getElementById("AM_TIMER_COLOR").value;
    var AM_PROMPT_START_TAG_COLOR = document.getElementById("AM_PROMPT_START_TAG_COLOR").value;
    var AM_PROMPT_END_TAG_COLOR = document.getElementById("AM_PROMPT_END_TAG_COLOR").value;
    var AM_GIT_TRACKED_COLOR = document.getElementById("AM_GIT_TRACKED_COLOR").value;
    var AM_GIT_UN_TRACKED_COLOR = document.getElementById("AM_GIT_UN_TRACKED_COLOR").value;

    var AM_VCS_COLOR_PREVIEW = document.getElementsByClassName("AM_VCS_COLOR_PREVIEW"); for(var i = 0; i < AM_VCS_COLOR_PREVIEW.length; i++) {AM_VCS_COLOR_PREVIEW[i].style.color = AM_VCS_COLOR;}
    var AM_SSH_COLOR_PREVIEW = document.getElementsByClassName("AM_SSH_COLOR_PREVIEW"); for(var i = 0; i < AM_SSH_COLOR_PREVIEW.length; i++) {AM_SSH_COLOR_PREVIEW[i].style.color = AM_SSH_COLOR;}
    var AM_NORMAL_COLOR_PREVIEW = document.getElementsByClassName("AM_NORMAL_COLOR_PREVIEW"); for(var i = 0; i < AM_NORMAL_COLOR_PREVIEW.length; i++) {AM_NORMAL_COLOR_PREVIEW[i].style.color = AM_NORMAL_COLOR;}
    var AM_ERROR_COLOR_PREVIEW = document.getElementsByClassName("AM_ERROR_COLOR_PREVIEW"); for(var i = 0; i < AM_ERROR_COLOR_PREVIEW.length; i++) {AM_ERROR_COLOR_PREVIEW[i].style.color = AM_ERROR_COLOR;}
    var AM_REV_COLOR_PREVIEW = document.getElementsByClassName("AM_REV_COLOR_PREVIEW"); for(var i = 0; i < AM_REV_COLOR_PREVIEW.length; i++) {AM_REV_COLOR_PREVIEW[i].style.color = AM_REV_COLOR;}
    var AM_BRANCH_COLOR_PREVIEW = document.getElementsByClassName("AM_BRANCH_COLOR_PREVIEW"); for(var i = 0; i < AM_BRANCH_COLOR_PREVIEW.length; i++) {AM_BRANCH_COLOR_PREVIEW[i].style.color = AM_BRANCH_COLOR;}
    var AM_LEFT_RIGHT_COLOR_PREVIEW = document.getElementsByClassName("AM_LEFT_RIGHT_COLOR_PREVIEW"); for(var i = 0; i < AM_LEFT_RIGHT_COLOR_PREVIEW.length; i++) {AM_LEFT_RIGHT_COLOR_PREVIEW[i].style.color = AM_LEFT_RIGHT_COLOR;}
    var AM_STASH_COLOR_PREVIEW = document.getElementsByClassName("AM_STASH_COLOR_PREVIEW"); for(var i = 0; i < AM_STASH_COLOR_PREVIEW.length; i++) {AM_STASH_COLOR_PREVIEW[i].style.color = AM_STASH_COLOR;}
    var AM_BARE_COLOR_PREVIEW = document.getElementsByClassName("AM_BARE_COLOR_PREVIEW"); for(var i = 0; i < AM_BARE_COLOR_PREVIEW.length; i++) {AM_BARE_COLOR_PREVIEW[i].style.color = AM_BARE_COLOR;}
    var AM_COMMIT_SINCE_COLOR_PREVIEW = document.getElementsByClassName("AM_COMMIT_SINCE_COLOR_PREVIEW"); for(var i = 0; i < AM_COMMIT_SINCE_COLOR_PREVIEW.length; i++) {AM_COMMIT_SINCE_COLOR_PREVIEW[i].style.color = AM_COMMIT_SINCE_COLOR;}
    var AM_FADE_COLOR_PREVIEW = document.getElementsByClassName("AM_FADE_COLOR_PREVIEW"); for(var i = 0; i < AM_FADE_COLOR_PREVIEW.length; i++) {AM_FADE_COLOR_PREVIEW[i].style.color = AM_FADE_COLOR;}
    var AM_VENV_COLOR_PREVIEW = document.getElementsByClassName("AM_VENV_COLOR_PREVIEW"); for(var i = 0; i < AM_VENV_COLOR_PREVIEW.length; i++) {AM_VENV_COLOR_PREVIEW[i].style.color = AM_VENV_COLOR;}
    var AM_PYTHON_COLOR_PREVIEW = document.getElementsByClassName("AM_PYTHON_COLOR_PREVIEW"); for(var i = 0; i < AM_PYTHON_COLOR_PREVIEW.length; i++) {AM_PYTHON_COLOR_PREVIEW[i].style.color = AM_PYTHON_COLOR;}
    var AM_RUBY_COLOR_PREVIEW = document.getElementsByClassName("AM_RUBY_COLOR_PREVIEW"); for(var i = 0; i < AM_RUBY_COLOR_PREVIEW.length; i++) {AM_RUBY_COLOR_PREVIEW[i].style.color = AM_RUBY_COLOR;}
    var AM_JAVA_COLOR_PREVIEW = document.getElementsByClassName("AM_JAVA_COLOR_PREVIEW"); for(var i = 0; i < AM_JAVA_COLOR_PREVIEW.length; i++) {AM_JAVA_COLOR_PREVIEW[i].style.color = AM_JAVA_COLOR;}
    var AM_GO_COLOR_PREVIEW = document.getElementsByClassName("AM_GO_COLOR_PREVIEW"); for(var i = 0; i < AM_GO_COLOR_PREVIEW.length; i++) {AM_GO_COLOR_PREVIEW[i].style.color = AM_GO_COLOR;}
    var AM_ELIXIR_COLOR_PREVIEW = document.getElementsByClassName("AM_ELIXIR_COLOR_PREVIEW"); for(var i = 0; i < AM_ELIXIR_COLOR_PREVIEW.length; i++) {AM_ELIXIR_COLOR_PREVIEW[i].style.color = AM_ELIXIR_COLOR;}
    var AM_CRYSTAL_COLOR_PREVIEW = document.getElementsByClassName("AM_CRYSTAL_COLOR_PREVIEW"); for(var i = 0; i < AM_CRYSTAL_COLOR_PREVIEW.length; i++) {AM_CRYSTAL_COLOR_PREVIEW[i].style.color = AM_CRYSTAL_COLOR;}
    var AM_NODE_COLOR_PREVIEW = document.getElementsByClassName("AM_NODE_COLOR_PREVIEW"); for(var i = 0; i < AM_NODE_COLOR_PREVIEW.length; i++) {AM_NODE_COLOR_PREVIEW[i].style.color = AM_NODE_COLOR;}
    var AM_PHP_COLOR_PREVIEW = document.getElementsByClassName("AM_PHP_COLOR_PREVIEW"); for(var i = 0; i < AM_PHP_COLOR_PREVIEW.length; i++) {AM_PHP_COLOR_PREVIEW[i].style.color = AM_PHP_COLOR;}
    var AM_GRADLE_COLOR_PREVIEW = document.getElementsByClassName("AM_GRADLE_COLOR_PREVIEW"); for(var i = 0; i < AM_GRADLE_COLOR_PREVIEW.length; i++) {AM_GRADLE_COLOR_PREVIEW[i].style.color = AM_GRADLE_COLOR;}
    var AM_MAVEN_COLOR_PREVIEW = document.getElementsByClassName("AM_MAVEN_COLOR_PREVIEW"); for(var i = 0; i < AM_MAVEN_COLOR_PREVIEW.length; i++) {AM_MAVEN_COLOR_PREVIEW[i].style.color = AM_MAVEN_COLOR;}
    var AM_TIMER_COLOR_PREVIEW = document.getElementsByClassName("AM_TIMER_COLOR_PREVIEW"); for(var i = 0; i < AM_TIMER_COLOR_PREVIEW.length; i++) {AM_TIMER_COLOR_PREVIEW[i].style.color = AM_TIMER_COLOR;}
    var AM_PROMPT_START_TAG_COLOR_PREVIEW = document.getElementsByClassName("AM_PROMPT_START_TAG_COLOR_PREVIEW"); for(var i = 0; i < AM_PROMPT_START_TAG_COLOR_PREVIEW.length; i++) {AM_PROMPT_START_TAG_COLOR_PREVIEW[i].style.color = AM_PROMPT_START_TAG_COLOR;}
    var AM_PROMPT_END_TAG_COLOR_PREVIEW = document.getElementsByClassName("AM_PROMPT_END_TAG_COLOR_PREVIEW"); for(var i = 0; i < AM_PROMPT_END_TAG_COLOR_PREVIEW.length; i++) {AM_PROMPT_END_TAG_COLOR_PREVIEW[i].style.color = AM_PROMPT_END_TAG_COLOR;}
    var AM_GIT_TRACKED_COLOR_PREVIEW = document.getElementsByClassName("AM_GIT_TRACKED_COLOR_PREVIEW"); for(var i = 0; i < AM_GIT_TRACKED_COLOR_PREVIEW.length; i++) {AM_GIT_TRACKED_COLOR_PREVIEW[i].style.color = AM_GIT_TRACKED_COLOR;}
    var AM_GIT_UN_TRACKED_COLOR_PREVIEW = document.getElementsByClassName("AM_GIT_UN_TRACKED_COLOR_PREVIEW"); for(var i = 0; i < AM_GIT_UN_TRACKED_COLOR_PREVIEW.length; i++) {AM_GIT_UN_TRACKED_COLOR_PREVIEW[i].style.color = AM_GIT_UN_TRACKED_COLOR;}

    var rawConfig = "\n"
                    + "#!/usr/bin/env zsh\n"
                    + "\n"
                    + "am_theme(){\n"
                    + "  [[ -z ${AM_VCS_COLOR} ]]              && AM_VCS_COLOR="+ AM_VCS_COLOR +"\n"
                    + "  [[ -z ${AM_SSH_COLOR} ]]              && AM_SSH_COLOR="+ AM_SSH_COLOR +"\n"
                    + "  [[ -z ${AM_NORMAL_COLOR} ]]           && AM_NORMAL_COLOR="+ AM_NORMAL_COLOR +"\n"
                    + "  [[ -z ${AM_ERROR_COLOR} ]]            && AM_ERROR_COLOR="+ AM_ERROR_COLOR +"\n"
                    + "  [[ -z ${AM_REV_COLOR} ]]              && AM_REV_COLOR="+ AM_REV_COLOR +"\n"
                    + "  [[ -z ${AM_BRANCH_COLOR} ]]           && AM_BRANCH_COLOR="+ AM_BRANCH_COLOR +"\n"
                    + "  [[ -z ${AM_LEFT_RIGHT_COLOR} ]]       && AM_LEFT_RIGHT_COLOR="+ AM_LEFT_RIGHT_COLOR +"\n"
                    + "  [[ -z ${AM_STASH_COLOR} ]]            && AM_STASH_COLOR="+ AM_STASH_COLOR +"\n"
                    + "  [[ -z ${AM_BARE_COLOR} ]]             && AM_BARE_COLOR="+ AM_BARE_COLOR +"\n"
                    + "  [[ -z ${AM_COMMIT_SINCE_COLOR} ]]     && AM_COMMIT_SINCE_COLOR="+ AM_COMMIT_SINCE_COLOR +"\n"
                    + "  [[ -z ${AM_FADE_COLOR} ]]             && AM_FADE_COLOR="+ AM_FADE_COLOR +"\n"
                    + "  [[ -z ${AM_VENV_COLOR} ]]             && AM_VENV_COLOR="+ AM_VENV_COLOR +"\n"
                    + "  [[ -z ${AM_PYTHON_COLOR} ]]           && AM_PYTHON_COLOR="+ AM_PYTHON_COLOR +"\n"
                    + "  [[ -z ${AM_RUBY_COLOR} ]]             && AM_RUBY_COLOR="+ AM_RUBY_COLOR +"\n"
                    + "  [[ -z ${AM_JAVA_COLOR} ]]             && AM_JAVA_COLOR="+ AM_JAVA_COLOR +"\n"
                    + "  [[ -z ${AM_GO_COLOR} ]]               && AM_GO_COLOR="+ AM_GO_COLOR +"\n"
                    + "  [[ -z ${AM_ELIXIR_COLOR} ]]           && AM_ELIXIR_COLOR="+ AM_ELIXIR_COLOR +"\n"
                    + "  [[ -z ${AM_CRYSTAL_COLOR} ]]          && AM_CRYSTAL_COLOR="+ AM_CRYSTAL_COLOR +"\n"
                    + "  [[ -z ${AM_NODE_COLOR} ]]             && AM_NODE_COLOR="+ AM_NODE_COLOR +"\n"
                    + "  [[ -z ${AM_PHP_COLOR} ]]              && AM_PHP_COLOR="+ AM_PHP_COLOR +"\n"
                    + "  [[ -z ${AM_GRADLE_COLOR} ]]           && AM_GRADLE_COLOR="+ AM_GRADLE_COLOR +"\n"
                    + "  [[ -z ${AM_MAVEN_COLOR} ]]            && AM_MAVEN_COLOR="+ AM_MAVEN_COLOR +"\n"
                    + "  [[ -z ${AM_TIMER_COLOR} ]]            && AM_TIMER_COLOR="+ AM_TIMER_COLOR +"\n"
                    + "  [[ -z ${AM_PROMPT_START_TAG_COLOR} ]] && AM_PROMPT_START_TAG_COLOR="+ AM_PROMPT_START_TAG_COLOR +"\n"
                    + "  [[ -z ${AM_PROMPT_END_TAG_COLOR} ]]   && AM_PROMPT_END_TAG_COLOR="+ AM_PROMPT_END_TAG_COLOR +"\n"
                    + "  [[ -z ${AM_GIT_TRACKED_COLOR} ]]      && AM_GIT_TRACKED_COLOR="+ AM_GIT_TRACKED_COLOR +"\n"
                    + "  [[ -z ${AM_GIT_UN_TRACKED_COLOR} ]]   && AM_GIT_UN_TRACKED_COLOR="+ AM_GIT_UN_TRACKED_COLOR +"\n"
                    + "}"


    document.getElementById("raw-config").value = rawConfig
}

updateTheme()

var colors = document.getElementsByClassName("color");
for (var i = 0; i < colors.length; i++) { colors[i].onchange = function() {updateTheme();} }

