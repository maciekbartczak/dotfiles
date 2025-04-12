export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git docker docker-compose)

source $ZSH/oh-my-zsh.sh

# OVM
export OVM_INSTALL="$HOME/.ovm/self"
export PATH="$PATH:$HOME/.ovm/bin"
export PATH="$PATH:$OVM_INSTALL/"

# pnpm
export PNPM_HOME="/home/mbartczak/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

##THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

## Auto-launch fish only for interactive terminal sessions
# if [[ $- == *i* ]] && [[ -z "$ZSH_ALREADY_EXECUTED" ]] && command -v fish &>/dev/null; then
  # export ZSH_ALREADY_EXECUTED=1
  # exec fish
# fi
