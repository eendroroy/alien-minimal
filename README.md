# alien-minimal

### Installation

##### antigen

add in your .zshrc

    antigen theme eendroroy/alien-minimal alien-minimal

##### [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization#overriding-and-adding-themes)

#### screenshot

[![asciicast](https://asciinema.org/a/125329.png)](https://asciinema.org/a/125329)

#### customizations
    
adding the following in .zshrc:

    PROMPT_START_TAG='-->'
    PROMPT_END_TAG=' $'
    PROMPT_START_TAG_COLOR=81
    PROMPT_END_TAG_COLOR=81

will make the prompt look like:

     --> ~ $
     --> ~ $ 1
    (venv) --> python-project $
    (venv) --> python-project $ 130

Credit goes to [@chrissicool](https://github.com/chrissicool) for ['256color'](https://github.com/chrissicool/zsh-256color)

Credit goes to [@mafredri](https://github.com/mafredri) for ['zsh-async'](https://github.com/mafredri/zsh-async)
