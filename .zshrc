# load antigen
source $HOME/.antigen/antigen.zsh

# load oh-my-zsh's library
antigen use oh-my-zsh

# plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle git
antigen bundle z

# theme
antigen theme denysdovhan/spaceship-prompt

# apply antigen
antigen apply

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

# editor
export EDITOR='nvim'

# history options
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

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

