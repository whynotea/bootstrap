# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -n "$BOOTSTRAP_ZSH" ] && [ -f "$BOOTSTRAP_ZSH/zshrc" ]; then
  source $BOOTSTRAP_ZSH/zshrc
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $BOOTSTRAP/.p10k.zsh ]] || source $BOOTSTRAP/.p10k.zsh
