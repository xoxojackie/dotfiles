# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
# Fig pre block. Keep at the top of this file.
which fig >/dev/null && # load antigen
source $HOME/.antigen/antigen.zsh

# load oh-my-zsh's library
antigen use oh-my-zsh

# plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle z
antigen bundle djui/alias-tips

# theme
antigen theme denysdovhan/spaceship-prompt

# apply antigen
antigen apply

# spaceship prompt settings
SPACESHIP_CHAR_SYMBOL="ϟ "
SPACESHIP_HOST_PREFIX="@ "
SPACESHIP_EXEC_TIME_PREFIX="⧖ "
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_EXIT_CODE_SHOW="true"
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_COLOR="white"
SPACESHIP_HOST_SHOW="always"

SPACESHIP_PROMPT_ORDER=(dir docker git pyenv ruby line_sep exec_time exit_code char)
SPACESHIP_RPROMPT_ORDER=(host)

case $HOST in
   Avalon*)
      SPACESHIP_HOST_COLOR_SSH="yellow"
      SPACESHIP_HOST_COLOR="yellow" ;;
   Guinevere*)
      SPACESHIP_HOST_COLOR_SSH="magenta"
      SPACESHIP_HOST_COLOR="magenta" ;;
   Merlin*)
      SPACESHIP_HOST_COLOR_SSH="blue"
      SPACESHIP_HOST_COLOR="blue" ;;
   Caelia*)
      SPACESHIP_HOST_COLOR_SSH="cyan"
      SPACESHIP_HOST_COLOR="cyan" ;;
   *)
      SPACESHIP_HOST_COLOR_SSH="red"
      SPACESHIP_HOST_COLOR="red" ;;
esac

# editor
export EDITOR='nvim'

#keybinds for history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# history options
HISTFILE=$HOME/.zsh_history
HISTSIZE=9999999
SAVEHIST=9999999
setopt appendhistory
setopt sharehistory

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

# bat theme
export BAT_THEME="Nord"

# iterm shell integration
if [[ -f "$HOME/.iterm2_shell_integration.zsh" ]]; then
   source "$HOME/.iterm2_shell_integration.zsh"
fi

# load ruby environment
if command -v rbenv ; then
   eval "$(rbenv init -)"
fi


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Fig post block. Keep at the bottom of this file.

if command -v fig &> /dev/null ; then
   source "$HOME/.fig/shell/zshrc.post.zsh"
fi

if command -v gpg &> /dev/null ; then
   export GPG_TTY=$(tty)
fi

if command -v thefuck &> /dev/null ; then
   eval $(thefuck --alias)
fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
