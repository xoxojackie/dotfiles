# load antigen
source $HOME/.antigen/antigen.zsh

# load oh-my-zsh's library
antigen use oh-my-zsh

# plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle git
antigen bundle tmux
antigen bundle z

# theme
antigen theme denysdovhan/spaceship-prompt

# apply antigen
antigen apply

# editor
export EDITOR='nvim'

# spaceship prompt settings
SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_HOST_PREFIX="@ "
SPACESHIP_EXEC_TIME_PREFIX="⧖ "
SPACESHIP_EXIT_CODE_SHOW="true"

SPACESHIP_PROMPT_ORDER=(dir exec_time exit_code)
SPACESHIP_RPROMPT_ORDER=(git docker user host)

case $HOST in
   Avalon)
      SPACESHIP_HOST_COLOR_SSH="yellow" ;;
   Guinivere)
      SPACESHIP_HOST_COLOR_SSH="green" ;;
   Merlin)
      SPACESHIP_HOST_COLOR_SSH="magenta" ;;
esac

# source aliases and functions
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.functions" ]] && source "$HOME/.functions"
