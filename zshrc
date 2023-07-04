export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode reminder

HIST_STAMPS="%D %T"

source $ZSH/oh-my-zsh.sh

source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jeffreytse/zsh-vi-mode

antigen apply

export PATH="$PATH:$HOME/.local/bin"

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

