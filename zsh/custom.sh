# Custom sh

# Python pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Node.js nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Set language to UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Brew Installations
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"

# Add visual code to path
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dekaauliyaakbar/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/dekaauliyaakbar/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dekaauliyaakbar/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/dekaauliyaakbar/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Default Editor and Visual
export VISUAL=vim
export EDITOR="$VISUAL"

# Golang
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# CLI Commands

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
function pipupdate(){
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
}
