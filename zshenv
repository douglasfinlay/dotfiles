export VISUAL="nvim"
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Machine-specific config
[ -f "$HOME/.zshenv.local" ] && source "$HOME/.zshenv.local"

