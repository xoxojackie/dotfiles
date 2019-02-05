# load antigen
source $HOME/.antigen/antigen.zsh

# load oh-my-zsh's library
antigen use oh-my-zsh

# plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# theme
antigen theme pure

# apply antigen
antigen apply
