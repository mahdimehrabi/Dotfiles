# Load Antigen
source "/home/mahdi/Applications/antigen.zsh"

# Load Antigen configurations
antigen init ~/Dotfiles/.antigenrc

# Load aliases
source "/home/mahdi/.bash_aliases"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.local/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export DOCKER_BUILDKIT=1

source ~/.bash_aliases
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
