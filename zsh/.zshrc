# String Encoding and Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# NVM - JS stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# SDKMAN - Java Stuff
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Pyenv - Python Stuff
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Setup prezto - ZSH theming
source "$HOME/.zprezto/init.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

# icu4c
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

# spaceship
#autoload -U promptinit; promptinit
#prompt spaceship

# Go stuff
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Setup Golang
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
#export GOROOT=$HOME/go
export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:$GOROOT/bin

# setup ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
eval "$(rbenv init -)"

# setup project
source ~/projects.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

# Enable syntax error with zsh
unsetopt nomatch 

# enable z
. ~/z/z.sh

# enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
