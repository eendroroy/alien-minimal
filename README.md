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

## Asciicast (1.4.1)

[![asciicast](http://asciinema.org/a/264037.svg)](https://asciinema.org/a/264037)

## Customizations

**add configurations in `~/.amrc`**

### VI prompt

Enable VI prompt (vi-mode is enabled by `bindkey -v`)

```bash
export AM_ENABLE_VI_PROMPT=1
```

#### Set vi prompt position
```bash

export AM_VI_PROMPT_POS=left_start
# (i) am-demo       G:master [1Y,9M] 6fd4c14 @1 + ⭑ ⭑ - - ?

export AM_VI_PROMPT_POS=left_end
# am-demo (i)       G:master [1Y,9M] 6fd4c14 @1 + ⭑ ⭑ - - ?

export AM_VI_PROMPT_POS=right_start
# am-demo       (i) G:master [1Y,9M] 6fd4c14 @1 + ⭑ ⭑ - - ?

export AM_VI_PROMPT_POS=right_end
# am-demo       G:master [1Y,9M] 6fd4c14 @1 + ⭑ ⭑ - - ? (i)
```

### Update left prompt asynchronously

```bash
export AM_ASYNC_L_PROMPT=1
```

### Show initial new line

Always show a new line

```bash
export AM_INITIAL_LINE_FEED=1
```

Unset `AM_INITIAL_LINE_FEED` to stop printing a new line.

### Two lines layout

Shows contextual info on the superior line

```bash
export AM_TWO_LINES=1
```

### Add start tag and end tag:

```bash
export AM_PROMPT_START_TAG='-->'     # previously `PROMPT_START_TAG`     
export AM_PROMPT_END_TAG='\ $'       # previously `PROMPT_END_TAG`       
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

Available version are: 
`PYTHON` `PYTHON_S` `RUBY` `RUBY_S` `JAVA` `JAVA_S`
`GO` `GO_S` `ELIXIR` `ELIXIR_S` `CRYSTAL` `CRYSTAL_S` `NODE` `NODE_S` `PHP` `PHP_S`

```bash
export AM_VERSIONS_PROMPT=(RUBY PYTHON JAVA GO CRYSTAL NODE PHP ELIXIR)
```

Customize Separator:
```bash
export AM_VERSION_PROMPT_SEP='|'

```

_Note: Prompt maintain declaration order._

### Show environment variables:

```bash
export AM_ENVVAR_PROMPT=(AWS_PROFILE)
```

Customize Separator:
```bash
export AM_VERSION_PROMPT_SEP='|'
```

_Note: Prompt maintain declaration order._

### Configure dirname in prompt:

```bash
export AM_DIR_EXPANSION_LEVEL=2
```

**The effect may be un-noticeable on faster CPUs.**

### Hide exit code:

```bash
export AM_HIDE_EXIT_CODE=1
```

### Keep previous RPROMPT:

```bash
export AM_KEEP_PROMPT=1
```

### Color themes:

```bash
1. export AM_THEME=mono
2. export AM_THEME=mono_bright
3. export AM_THEME=terminal
4. export AM_THEME=soft
5. export AM_THEME=default
```
_Note: **Unset `AM_THEME` to use default color scheme.**_

**Apart from these default themes, custom colors can be defined:**

```bash
export AM_VCS_COLOR=1          # color for VCS (G: M: V:)
export AM_SSH_COLOR=11         # color for ssh indicator
export AM_NORMAL_COLOR=12      # color for normal text
export AM_ERROR_COLOR=1        # color for ERROR
export AM_REV_COLOR=14         # color for VCS Revision number
export AM_BRANCH_COLOR=10      # color for VCS BRANCH name
export AM_LEFT_RIGHT_COLOR=3   # color for GIT Left-Right status
export AM_STASH_COLOR=3        # color for GIT stash count
export AM_BARE_COLOR=3         # color for GIT bare repo indicator
export AM_COMMIT_SINCE_COLOR=6 # color for last commit time
export AM_FADE_COLOR=8         # color for fade text color
export AM_VENV_COLOR=8         # color fir python virtual env text
export AM_PYTHON_COLOR=2       # color for python version text
export AM_RUBY_COLOR=1         # color for ruby version text
export AM_JAVA_COLOR=15        # color for java version text
export AM_TIMER_COLOR=14       # color for command execution time
export AM_VIINS_COLOR=39       # color for viins mode
export AM_VICMD_COLOR=208      # color vicmd mode
```

Or creating a new theme file:

__/path/to/custom/theme.zsh__

```bash
#!/usr/bin/env zsh

am_theme(){
  AM_VCS_COLOR=248
  AM_SSH_COLOR=143
  AM_NORMAL_COLOR=39
  AM_ERROR_COLOR=208
  AM_REV_COLOR=248
  AM_BRANCH_COLOR=78
  AM_LEFT_RIGHT_COLOR=222
  AM_STASH_COLOR=222
  AM_BARE_COLOR=222
  AM_COMMIT_SINCE_COLOR=244
  AM_FADE_COLOR=242
  AM_VENV_COLOR=245
  AM_PYTHON_COLOR=40
  AM_RUBY_COLOR=196
  AM_JAVA_COLOR=178
  AM_TIMER_COLOR=248
  AM_VIINS_COLOR=39
  AM_VICMD_COLOR=208
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
export AM_JAVA_SYM='JAVA:'  # JAVA Version Symbol
export AM_PY_SYM='PY:'      # Python Version Symbol
export AM_RB_SYM='RB:'      # Ruby Version Symbol 
export AM_GO_SYM='GO:'      # Go Version Symbol 
export AM_ELIXIR_SYM='EX:'  # Elixir Version Symbol 
export AM_CRYSTAL_SYM='CR:' # Crystal Version Symbol 
export AM_NODE_SYM='NODE:'  # Node Version Symbol 
export AM_PHP_SYM='PHP:'    # PHP Version Symbol 

export AM_GIT_STASH_SYM='@'  # Git Stash Count Symbbol
export AM_GIT_BARE_SYM='☢'   # Git bare repo Symbbol
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
