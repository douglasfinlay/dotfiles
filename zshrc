if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HIST_STAMPS="%D %T"

export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode reminder

# Load ZSH plugins.
source "$HOME/dotfiles/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jeffreytse/zsh-vi-mode
antigen theme romkatv/powerlevel10k
antigen apply

export PATH="$HOME/.local/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/dotfiles/p10k.zsh.
[[ ! -f ~/dotfiles/p10k.zsh ]] || source ~/dotfiles/p10k.zsh

# Load NVM if installed.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add Yarn global bin to PATH if available.
if command -v yarn >/dev/null; then
    yarn_bin=$(yarn global bin 2>/dev/null)
    export PATH="$yarn_bin:$PATH"
fi

# Machine-specific config.
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

