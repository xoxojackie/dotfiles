# load antigen
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

# start a tmux session when ssh-ing in 
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
   case $HOST in 
      Wart*)
         tmux new -AsMain
   esac
fi
   
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
export PATH="$PATH:/home/thewiz/.local/bin"
export PATH="$PATH:/opt/homebrew/bin"

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


if command -v thefuck &> /dev/null ; then
   eval $(thefuck --alias)
fi
