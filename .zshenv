OS=$(cat /etc/os-release | grep -E ^ID=)
export OS=${OS#"ID="}

if [[ -z $BOOTSTRAP ]] || [[ ! -f $BOOTSTRAP/bootstrap ]]; then
  if [[ -n $ZDOTDIR ]]; then
    export BOOTSTRAP=$ZDOTDIR
  elif [[ $HOME/.bootstrap ]]; then
    export BOOTSTRAP=$HOME/.bootstrap
  fi
fi

source $BOOTSTRAP/bootstrap

if [[ -n $BOOTSTRAP_ZSH ]] && [[ -f $BOOTSTRAP_ZSH/config/paths.zsh ]]; then
  source $BOOTSTRAP_ZSH/config/paths.zsh
fi
if [[ -n $BOOTSTRAP_WORK ]] && [[ -f $BOOTSTRAP_WORK/config/paths.zsh ]]; then
  source $BOOTSTRAP_WORK/config/paths.zsh
fi
if [[ -n $BOOTSTRAP_CENTOS ]] && [[ -f $BOOTSTRAP_CENTOS/config/paths.zsh ]]; then
  source $BOOTSTRAP_CENTOS/config/paths.zsh
fi

if [[ -n $WSL_DISTRO_NAME ]] || [[ -n $WHYNOTEA_WSL_NS ]]; then
  source $BOOTSTRAP_ZSH/config/wsl2.zsh
else
  source $BOOTSTRAP_ZSH/config/linux.zsh
fi