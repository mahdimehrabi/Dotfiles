# Load Antigen
source "/home/mahdi/opt/antigen/antigen.zsh"

# Load Antigen configurations
antigen init ~/.antigenrc

# Load aliases
source "/home/mahdi/.bash_aliases"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.local/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export DOCKER_BUILDKIT=1
