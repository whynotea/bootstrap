OS=$(cat /etc/os-release | egrep ^ID=)
export OS=${OS#"ID="}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -z $BOOTSTRAP ]] || [[ ! -f $BOOTSTRAP/bootstrap ]]; then
  if [[ -n $ZDOTDIR ]]; then
    export BOOTSTRAP=$ZDOTDIR
  elif [[ $HOME/.bootstrap ]]; then
    export BOOTSTRAP=$HOME/.bootstrap
  fi
fi
if [[ -n $BOOTSTRAP ]] && [[ -f $BOOTSTRAP/bootstrap ]]; then
  source $BOOTSTRAP/bootstrap
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $BOOTSTRAP/.p10k.zsh ]] || source $BOOTSTRAP/.p10k.zsh
