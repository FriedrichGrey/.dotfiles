[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
# [[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
# [[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
[[ -f ~/.zsh/wsl2fix.zsh ]] && source ~/.zsh/wsl2fix.zsh
[[ -f ~/.zsh/keybinds.zsh ]] && source ~/.zsh/keybinds.zsh

# Load Starship
eval "$(starship init zsh)"