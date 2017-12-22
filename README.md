# alien-minimal 

[![GitHub tag](https://img.shields.io/github/tag/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/tags)

[![Contributors](https://img.shields.io/github/contributors/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/graphs/contributors)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/eendroroy/alien-minimal/master.svg)](https://github.com/eendroroy/alien-minimal)
[![license](https://img.shields.io/github/license/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/issues)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/issues?q=is%3Aissue+is%3Aclosed)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/pulls)
[![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/pulls?q=is%3Apr+is%3Aclosed)

**alien-minimal** theme is faster than a lot other themes.

**Why?** It updates part of the prompt asyncronously - the time consuming processings like git status checking, git dirty copy checking etc.

**How?** It starts a background job for these process, and in the mean time shows initial prompt and lets you use the terminal as you would normally.

**alien-minimal** is **independent** of any library/framework like Oh-My-Zsh or Prezto. Whatever it needs already included.


## Installation

Add the following line to your .zshrc depending on your zsh plugin manager

##### [antigen](https://github.com/zsh-users/antigen):

    antigen theme eendroroy/alien-minimal alien-minimal

##### [zgen](https://github.com/tarjoilija/zgen):

    zgen load eendroroy/alien-minimal

##### [zplug](https://github.com/zplug/zplug):

    zplug "eendroroy/alien-minimal"

##### [oh-my-zsh: Overriding and Adding Themes](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization#overriding-and-adding-themes)

## Asciicast

[![asciicast](http://asciinema.org/a/152668.png)](https://asciinema.org/a/152668)

## Customizations

**add configurations before plugin definitions**
    
### Add start tag and end tag:

    export PROMPT_START_TAG='-->'
    export PROMPT_END_TAG=' $'
    export PROMPT_START_TAG_COLOR=81
    export PROMPT_END_TAG_COLOR=81

**Result:**

     --> ~ $
     --> ~ $ 1
    (venv) --> python-project $
    (venv) --> python-project $ 130

You can additionally show the error color on prompt start tag:

    export AM_ERROR_ON_START_TAG=1

_Note: if `PROMPT_START_TAG` is empty, this configuration will be ignored._

### Show versions:

Available version are: `RUBY` `PYTHON` `JAVA`

    export AM_VERSIONS_PROMPT=(RUBY PYTHON JAVA)

_Note: Prompt maintain declaration order._

### Show execution time for each process:

    export AM_SHOW_PROCESS_TIME=0 # hide
    export AM_SHOW_PROCESS_TIME=1 # show
    export AM_SHOW_PROCESS_TIME=2 # show if not 0

_Note: **Unset `AM_SHOW_PROCESS_TIME` to hide process time.**_

### Configure dirname in prompt:

    export AM_SHOW_FULL_DIR=1 # shows the full dir path
    export AM_SHOW_FULL_DIR=0 # shows the current dir name

Update left prompt asynchrononusly (initially show full directory path, update to short form later, this is just a fancy option)

    export AM_UPDATE_L_PROMPT=1

_Note: this overrides `AM_SHOW_FULL_DIR` configuration._

**The effect may be un-noticable on faster CPUs.**

### Hide exit code:

    export AM_HIDE_EXIT_CODE=1

### Use 8 bit color:

    export AM_USE_TERMINAL_COLOR=1


### Color themes:

    1. export AM_THEME=MONO
    2. export AM_THEME=MONO_BRIGHT
    2. export AM_THEME=DEFAULT

_Note: **Unset `AM_THEME` to use default color scheme.**_

**Apart from these default themes, custom colors can be defined:**

    export am_vcs_color=1          # color for VCS (G: M: V:)
    export am_ssh_color=11         # color for ssh indicaator
    export am_normal_color=12      # color for normal text
    export am_error_color=1        # color for ERROR
    export am_rev_color=14         # color for VCS Revision number
    export am_branch_color=10      # color for VCS BRANCH name
    export am_left_right_color=3   # color for GIT Left-Right status
    export am_commit_since_color=6 # color for last commit time
    export am_fade_color=8         # color for fade text color
    export am_venv_color=8         # color fir python virtual env text
    export am_python_color=2       # color for python version text
    export am_ruby_color=1         # color for ruby version text
    export am_java_color=15        # color for java version text
    export am_timer_color=14       # color for command execution time

### Nerd Font:

Enable Nerd Font

    export USE_NERD_FONT=1

### promptlib-zsh Configs:

#### customize symbols

    export PLIB_GIT_ADD_SYM=+
    export PLIB_GIT_DEL_SYM=-
    export PLIB_GIT_MOD_SYM=⭑
    export PLIB_GIT_NEW_SYM=?
    export PLIB_GIT_PUSH_SYM=↑
    export PLIB_GIT_PULL_SYM=↓

_Note: this overrides `USE_NERD_FONT` configuration._

#### customize colors

    export PLIB_GIT_TRACKED_COLOR=green
    export PLIB_GIT_UNTRACKED_COLOR=red

## Libraries Used

- ['256color'](https://github.com/chrissicool/zsh-256color) by **[@chrissicool](https://github.com/chrissicool)**
- ['zsh-async'](https://github.com/mafredri/zsh-async) by **[@mafredri](https://github.com/mafredri)**
- ['promptlib-zsh'](https://github.com/eendroroy/promptlib-zsh) by **[@eendroroy](https://github.com/eendroroy)**

## Contributing

Bug reports and pull requests are welcome on GitHub at [alien-minimal](https://github.com/eendroroy/alien-minimal) repository.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Author

* **indrajit** - *Owner* - [eendroroy](https://github.com/eendroroy)

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
