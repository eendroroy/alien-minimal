# alien-minimal

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
git submodule update --init --recursive # --remote
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
`PYTHON`,`PYTHON_S`,`RUBY`,`RUBY_S`,`JAVA`,`JAVA_S`,`GO`,`GO_S`,`ELIXIR`,`ELIXIR_S`,
`CRYSTAL`,`CRYSTAL_S`,`NODE`,`NODE_S`,`PHP`,`PHP_S`,`GRADLE`,`MAVEN`

```bash
export AM_VERSIONS_PROMPT=(RUBY PYTHON JAVA GO CRYSTAL NODE PHP ELIXIR GRADLE)
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
1. export AM_THEME=mono_bright
1. export AM_THEME=terminal
1. export AM_THEME=soft
1. export AM_THEME=default
```

_Note: **Unset `AM_THEME` to use default color scheme.**_

**Apart from these default themes, custom colors can be defined:**

Use [previewer](https://eendroroy.github.io/alien-minimal/previewer/) to easily preview colors.

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
  AM_GO_COLOR=81
  AM_ELIXIR_COLOR=81
  AM_CRYSTAL_COLOR=8
  AM_NODE_COLOR=2
  AM_PHP_COLOR=5
  AM_GRADLE_COLOR=2
  AM_MAVEN_COLOR=3
  AM_TIMER_COLOR=248
  AM_VIINS_COLOR=39
  AM_VICMD_COLOR=208
  AM_PROMPT_START_TAG_COLOR=39
  AM_PROMPT_END_TAG_COLOR=39
  AM_GIT_TRACKED_COLOR=78
  AM_GIT_UN_TRACKED_COLOR=208
  AM_LEFT_RIGHT_COLOR=252
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
export AM_VIM_INSERT_SYM='(i)'
export AM_VIM_NORMAL_SYM='(n)'
export AM_GIT_STASH_SYM='@'
export AM_GIT_BARE_SYM='☢'
export AM_GIT_SYM='G'
export AM_HG_SYM='H'
export AM_SVN_SYM='S'
export AM_SSH_SYM='[S]'
export AM_JAVA_SYM='JAVA:'
export AM_PY_SYM='PY:'
export AM_RB_SYM='RB:'
export AM_GO_SYM='GO:'
export AM_ELIXIR_SYM='EX:'
export AM_CRYSTAL_SYM='CR:'
export AM_NODE_SYM='⬡ '
export AM_PHP_SYM='PHP:'
export AM_GRADLE_SYM='GRADLE:'
export AM_MAVEN_SYM='MVN:'
export AM_GIT_REBASING_SYMBOL='⇋'
export AM_GIT_PUSH_SYM='↑'
export AM_GIT_PULL_SYM='↓'
export AM_LEFT_RIGHT_SEP='|'
```

_Note: this overrides `AM_USE_NERD_FONT` configuration._

## Libraries Used

- ['256color'](https://github.com/chrissicool/zsh-256color) by **[@chrissicool](https://github.com/chrissicool)**
- ['zsh-async'](https://github.com/mafredri/zsh-async) by **[@mafredri](https://github.com/mafredri)**
- ['promptlib-zsh'](https://github.com/eendroroy/promptlib-zsh) by **[@eendroroy](https://github.com/eendroroy)**

## Contributing

Bug reports and pull requests are welcome on GitHub at [alien-minimal](https://github.com/eendroroy/alien-minimal)
repository. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it ( https://github.com/eendroroy/alien-minimal/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
