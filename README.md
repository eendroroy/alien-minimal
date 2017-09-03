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
Prompt maintain declaration order.

    export AM_VERSIONS_PROMPT=(RUBY PYTHON JAVA)

Use 8 bit color:

    export AM_USER_TERMINAL_COLOR=1

Show time for each process:

    export AM_SHOW_PROCESS_TIME=1

Update left prompt asynchrononusly (initially show full directory path, update to short form later, this is just a fancy option)

    export AM_UPDATE_L_PROMPT=1

Color themes:

    1. export AM_THEME=MONO
    2. export AM_THEME=MONO_BRIGHT

#### libs

['256color'](https://github.com/chrissicool/zsh-256color) by **[@chrissicool](https://github.com/chrissicool)**

['zsh-async'](https://github.com/mafredri/zsh-async) by **[@mafredri](https://github.com/mafredri)**

['promptlib-zsh'](https://github.com/eendroroy/promptlib-zsh) by **[@eendroroy](https://github.com/eendroroy)**

