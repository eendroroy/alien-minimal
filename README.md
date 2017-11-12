# alien-minimal

### Installation

Add the following line to your .zshrc depending on your zsh plugin manager

##### [antigen](https://github.com/zsh-users/antigen):

    antigen theme eendroroy/alien-minimal alien-minimal

##### [zgen](https://github.com/tarjoilija/zgen):

    zgen load eendroroy/alien-minimal

##### [zplug](https://github.com/zplug/zplug):

    zplug "eendroroy/alien-minimal"

##### [oh-my-zsh: Overriding and Adding Themes](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization#overriding-and-adding-themes)

#### screencast

[![asciicast](http://asciinema.org/a/134365.png)](https://asciinema.org/a/134365)

#### customizations
    
adding the following in .zshrc:

    export PROMPT_START_TAG='-->'
    export PROMPT_END_TAG=' $'
    export PROMPT_START_TAG_COLOR=81
    export PROMPT_END_TAG_COLOR=81

will make the prompt look like:

     --> ~ $
     --> ~ $ 1
    (venv) --> python-project $
    (venv) --> python-project $ 130

Show versions:

Available version are: `RUBY` `PYTHON` `JAVA`

    export AM_VERSIONS_PROMPT=(RUBY PYTHON JAVA)

Note: Prompt maintain declaration order.

Use 8 bit color:

    export AM_USER_TERMINAL_COLOR=1

Show execution time for each process:

    export AM_SHOW_PROCESS_TIME=0 # hide
    export AM_SHOW_PROCESS_TIME=1 # show
    export AM_SHOW_PROCESS_TIME=2 # show if not 0

Update left prompt asynchrononusly (initially show full directory path, update to short form later, this is just a fancy option)

    export AM_UPDATE_L_PROMPT=1

Color themes:

    1. export AM_THEME=MONO
    2. export AM_THEME=MONO_BRIGHT

Apart from these default themes, custom colors can be defined:

    export am_vcs_color=1          # color for VCS (G: M: V:)
    export am_ssh_color=11         # color for ssh indicaator
    export am_normal_color=12      # color for normal text
    export am_error_color=1        # color for ERROR
    export am_rev_color=14         # color for VCS Revision number
    export am_branch_color=10      # color for VCS BRANCH name
    export am_dirty_color=2        # color for VCS DIRTY copy indicator
    export am_left_right_color=3   # color for GIT Left-Right status
    export am_commit_since_color=6 # color for last commit time
    export am_fade_color=8         # color for fade text color
    export am_venv_color=8         # color fir python virtual env text
    export am_python_color=2       # color for python version text
    export am_ruby_color=1         # color for ruby version text
    export am_java_color=15        # color for java version text
    export am_timer_color=14       # color for command execution time

#### libs

['256color'](https://github.com/chrissicool/zsh-256color) by **[@chrissicool](https://github.com/chrissicool)**
['zsh-async'](https://github.com/mafredri/zsh-async) by **[@mafredri](https://github.com/mafredri)**
['promptlib-zsh'](https://github.com/eendroroy/promptlib-zsh) by **[@eendroroy](https://github.com/eendroroy)**
