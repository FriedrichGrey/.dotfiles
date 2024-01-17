[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
# [[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
[[ -f ~/.zsh/keybinds.zsh ]] && source ~/.zsh/keybinds.zsh
[[ -f ~/.zsh/wsl2fix.zsh ]] && source ~/.zsh/wsl2fix.zsh

source ${ZSH_CUSTOM:-~/.zsh}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load Starship
eval "$(starship init zsh)"
