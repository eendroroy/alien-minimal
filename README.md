# alien-minimal 

[![GitHub tag](https://img.shields.io/github/tag/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/tags)

[![Contributors](https://img.shields.io/github/contributors/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/graphs/contributors)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/eendroroy/alien-minimal/master.svg)](https://github.com/eendroroy/alien-minimal)
[![license](https://img.shields.io/github/license/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/issues)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/issues?q=is%3Aissue+is%3Aclosed)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/pulls)
[![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/eendroroy/alien-minimal.svg)](https://github.com/eendroroy/alien-minimal/pulls?q=is%3Apr+is%3Aclosed)

**alien-minimal** theme is faster than many other themes.

**Why?** It updates part of the prompt asynchronously - the time consuming processing like git status checking,
git dirty copy checking etc.

**How?** It starts a background job for these process, and in the mean time shows initial prompt and lets you use the
terminal as you would normally.

**alien-minimal** is **independent** of any library/framework like Oh-My-Zsh or Prezto.


## Installation

Add the following line in `~/.zshrc` depending on zsh plugin manager

##### [antigen](https://github.com/zsh-users/antigen):

```bash
antigen theme eendroroy/alien-minimal alien-minimal
```

##### [zgen](https://github.com/tarjoilija/zgen):

```bash
zgen load eendroroy/alien-minimal
```

##### [zplug](https://github.com/zplug/zplug):

```bash
zplug "eendroroy/alien-minimal"
```

##### [oh-my-zsh: Overriding and Adding Themes](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization#overriding-and-adding-themes)

```bash
# if using git 2.13 or higher
git clone --recurse-submodules https://github.com/eendroroy/alien-minimal.git ${ZSH_CUSTOM}/themes/alien-minimal

# if lower version use
cd ${ZSH_CUSTOM}/themes/alien-minimal
git clone https://github.com/eendroroy/alien-minimal.git
git submodule update --init --recursive
```

Then set `ZSH_THEME="alien-minimal/alien-minimal"` in the `~/.zshrc` file.


## Asciicast (1.1.1)

[![asciicast](http://asciinema.org/a/216110.svg)](https://asciinema.org/a/216110)

## Customizations

**add configurations before plugin definitions**

### VI prompt (Not properly working at the moment)

Enable VI prompt (vi-mode is enabled by `bindkey -v`)

```bash
export AM_ENABLE_VI_PROMPT=1
```

### Show initial new line

Always show a new line

```bash
AM_INITIAL_LINE_FEED=1
```

Only show new for non-empty input (pressing enter with out writing anything will not print a new line)

```bash
AM_INITIAL_LINE_FEED=2
```

Unset `AM_INITIAL_LINE_FEED` to never print a new line.

### Add start tag and end tag:

```bash
export AM_PROMPT_START_TAG='-->'     # previously `PROMPT_START_TAG`     
export AM_PROMPT_END_TAG=' $'        # previously `PROMPT_END_TAG`       
export AM_PROMPT_START_TAG_COLOR=81  # previously `PROMPT_START_TAG_COLOR`  
export AM_PROMPT_END_TAG_COLOR=81    # previously `PROMPT_END_TAG_COLOR`    
```

**Result:**

```bash
--> ~ $
--> ~ $ 1
(venv) --> python-project $
(venv) --> python-project $ 130
```

You can additionally show the error color on prompt start tag:

```bash
export AM_ERROR_ON_START_TAG=1
```

_Note: if `AM_PROMPT_START_TAG` is empty, this configuration will be ignored._

### Show versions:

Available version are: `RUBY` `PYTHON` `JAVA` `GO` `CRYSTAL` `NODE` `PHP`

```bash
    export AM_VERSIONS_PROMPT=(RUBY PYTHON JAVA GO CRYSTAL NODE PHP)
```

_Note: Prompt maintain declaration order._

### Show execution time for each process:

```bash
export AM_SHOW_PROCESS_TIME=0 # hide
export AM_SHOW_PROCESS_TIME=1 # show
export AM_SHOW_PROCESS_TIME=2 # show if not 0
```

_Note: **Unset `AM_SHOW_PROCESS_TIME` to hide process time.**_

### Configure dirname in prompt:

```bash
export AM_SHOW_FULL_DIR=1 # shows the full dir path
export AM_SHOW_FULL_DIR=0 # shows the current dir name
```

Update left prompt asynchronously (initially show full directory path, update to short form later, this is just a fancy option)

```bash
export AM_UPDATE_L_PROMPT=1
```

_Note: this overrides `AM_SHOW_FULL_DIR` configuration._

**The effect may be un-noticeable on faster CPUs.**

### Hide exit code:

```bash
export AM_HIDE_EXIT_CODE=1
```

### Keep previous RPROMPT:

```bash
export AM_KEEP_PROMPT=1
```

### Update RPROMPT segments one by one:

```bash
export AM_SEGMENT_UPDATE=1
```

This will update right prompt segment by segment (ie. at first version info, then background job count, and then ...).

### Color themes:

```bash
1. export AM_THEME=mono
1. export AM_THEME=mono_bright
1. export AM_THEME=terminal
1. export AM_THEME=soft
1. export AM_THEME=default
```
_Note: **Unset `AM_THEME` to use default color scheme.**_

**Apart from these default themes, custom colors can be defined:**

```bash
export am_vcs_color=1          # color for VCS (G: M: V:)
export am_ssh_color=11         # color for ssh indicator
export am_normal_color=12      # color for normal text
export am_error_color=1        # color for ERROR
export am_rev_color=14         # color for VCS Revision number
export am_branch_color=10      # color for VCS BRANCH name
export am_left_right_color=3   # color for GIT Left-Right status
export am_stash_color=3        # color for GIT stash count
export am_bare_color=3         # color for GIT bare repo indicator
export am_commit_since_color=6 # color for last commit time
export am_fade_color=8         # color for fade text color
export am_venv_color=8         # color fir python virtual env text
export am_python_color=2       # color for python version text
export am_ruby_color=1         # color for ruby version text
export am_java_color=15        # color for java version text
export am_timer_color=14       # color for command execution time
export am_viins_color=39       # color for viins mode
export am_vicmd_color=208      # color vicmd mode
```

Or creating a new theme file:

__/path/to/custom/theme.zsh__

```bash
#!/usr/bin/env zsh

am_theme(){
  am_vcs_color=248
  am_ssh_color=143
  am_normal_color=39
  am_error_color=208
  am_rev_color=248
  am_branch_color=78
  am_left_right_color=222
  am_stash_color=222
  am_bare_color=222
  am_commit_since_color=244
  am_fade_color=242
  am_venv_color=245
  am_python_color=40
  am_ruby_color=196
  am_java_color=178
  am_timer_color=248
  am_viins_color=39
  am_vicmd_color=208
}
```

Then activate the theme using:

```bash
export AM_CUSTOM_THEME_PATH=/path/to/custom/theme.zsh
```

### Nerd Font:

**Nerd Font must be installed [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)**

Enable Nerd Font

```bash
export AM_USE_NERD_FONT=1 # previously `USE_NERD_FONT`
```

### customize symbols

```bash
export AM_GIT_STASH_SYM='@'  # Git Stash Count Symbbol
export AM_GIT_BARE_SYM='☢'   # Git bare repo Symbbol
export AM_JAVA_SYM='J:'      # JAVA Version Symbol
export AM_PY_SYM='P:'        # Python Version Symbol
export AM_RB_SYM='R:'        # Ruby Version Symbol 
export AM_GIT_SYM=G          # Git Symbol
export AM_HG_SYM=M           # Mercurial Symbol
export AM_SSH_SYM=[S]        # SSH Indicator Symbol
export AM_VIM_INSERT_SYM='[I]'  # VI mode symbol
export AM_VIM_NORMAL_SYM='[N]'  # VI mode symbol
 
export AM_GIT_ADD_SYM='+'  # Git New Tracked File Symbol
export AM_GIT_DEL_SYM='-'  # Git Deleted File Symbol
export AM_GIT_MOD_SYM='*'  # Git Modified File Symbol
export AM_GIT_NEW_SYM='?'  # Git New Un-tracked File Symbol
export AM_GIT_PUSH_SYM='↑' # Git Un-pushed Commit Symbol
export AM_GIT_PULL_SYM='↓' # Git New Commit Symbol
```
_Note: this overrides `AM_USE_NERD_FONT` configuration._

### customize colors

```bash
export AM_GIT_TRACKED_COLOR=green
export AM_GIT_UN_TRACKED_COLOR=red
```
## Libraries Used

- ['256color'](https://github.com/chrissicool/zsh-256color) by **[@chrissicool](https://github.com/chrissicool)**
- ['zsh-async'](https://github.com/mafredri/zsh-async) by **[@mafredri](https://github.com/mafredri)**
- ['promptlib-zsh'](https://github.com/eendroroy/promptlib-zsh) by **[@eendroroy](https://github.com/eendroroy)**

## Contributing

Bug reports and pull requests are welcome on GitHub at [alien-minimal](https://github.com/eendroroy/alien-minimal)
repository. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

  1. Fork it ( https://github.com/eendroroy/alien-minimal/fork )
  1. Create your feature branch (`git checkout -b my-new-feature`)
  1. Commit your changes (`git commit -am 'Add some feature'`)
  1. Push to the branch (`git push origin my-new-feature`)
  1. Create a new Pull Request

## Author

* **indrajit** - *Owner* - [eendroroy](https://github.com/eendroroy)

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
