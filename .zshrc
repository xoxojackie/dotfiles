# load zplug
source $HOME/.zplug/init.zsh

# plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh

# theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# apply zplug
zplug load

# editor
export EDITOR='nvim'

# spaceship prompt settings
SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_HOST_PREFIX="@ "
SPACESHIP_EXEC_TIME_PREFIX="⧖ "

SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true" SPACESHIP_EXIT_CODE_SHOW="true"
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_COLOR="white"
SPACESHIP_HOST_SHOW="always"

SPACESHIP_PROMPT_ORDER=(dir docker git pyenv ruby line_sep exec_time exit_code char)
SPACESHIP_RPROMPT_ORDER=(host)

case $HOST in
   Avalon*)
      SPACESHIP_HOST_COLOR_SSH="yellow" ;;
   Guinivere*)
      SPACESHIP_HOST_COLOR_SSH="blue" ;;
   Merlin*)
      SPACESHIP_HOST_COLOR_SSH="magenta" ;;
   *)
      SPACESHIP_HOST_COLOR_SSH="green" ;;
esac

# source aliases and functions
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.functions" ]] && source "$HOME/.functions"

# add .bin to path
export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:/snap/bin"

# platform specific options
PLATFORM=$(uname)

if [[ $PLATFORM == "Linux" ]]; then
   eval `dircolors ~/.config/dircolors/nord-dircolors`
elif [[ $PLATFORM == "Darwin" ]]; then
   eval `gdircolors ~/.config/dircolors/nord-dircolors`
fi

# host spedific options
if [[ $HOST == "Guinevere" ]] || [[ $HOST == "Caelia" ]]; then
   eval "$(rbenv init -)"
fi

# iterm shell integration
if [[ -f "$HOME/.iterm2/.iterm2_shell_integration.zsh" ]]; then
   source "$HOME/.iterm2/.iterm2_shell_integration.zsh"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
