#!/usr/bin/env bash

# Change Macbook Password
# https://support.apple.com/en-hk/HT202860
# Change to Dark Mode
# http://osxdaily.com/2018/10/12/how-enable-dark-mode-theme-macos/

######################################
### constants and definitions      ###
######################################

PY3_VERSION=3.7.3
PY2_VERSION=2.7.16


# Add to zshrc
cat <<EOT >> ~/.zshrc

# String Encoding and Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
EOT

######################################
### the basics                     ###
######################################

# install xcode terminal
xcode-select --install

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/cask
brew cask

brew install zlib
brew install sqlite
brew install cmake

######################################
### install prerequisite softwares ###
######################################
# chrome
brew cask install google-chrome 

# firefox
brew cask install firefox

# visual studio code
brew cask install visual-studio-code

######################################
### development tools              ###
######################################
# iterm
brew cask install iterm2

# vim
brew install vim

# git
brew install git
git config --global core.editor "vim"
# git config --global user.email "USEREMAIL"
git config --global --edit # change user
brew install bfg 

# zsh
brew install zsh
exec $SHELL
chsh -s $(which zsh)

# curl and libressl
brew install curl
brew install libressl

cat <<EOT >> ~/.zshrc

# For compilers to find zlib you may need to set:
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/ruby/lib"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/openssl@1.1/lib"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/sqlite/lib"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/ncurses/lib"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/curl/lib"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/libressl/lib"

export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/ruby/include"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/openssl@1.1/include"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/sqlite/include"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/curl/include"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/libressl/include"

# For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/sqlite/lib/pkgconfig"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/curl/lib/pkgconfig"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/libressl/lib/pkgconfig"

export PATH="/usr/local/opt/ncurses/bin:$PATH"
EOT

# fzf
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

######################################
### programming languages          ###
######################################

# python
brew install pyenv
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshenv
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshenv

exec "$SHELL"
pyenv install ${PY3_VERSION}
pyenv install ${PY2_VERSION}
pyenv global ${PY3_VERSION} ${PY2_VERSION}
brew install pipenv

# java, gradle, spark
curl -s "https://get.sdkman.io" | bash
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
sdk install java 8.0.202-zulu
sdk install gradle
sdk install maven 

# nodejs: nvm, yarn 
# check yarn version: https://github.com/nvm-sh/nvm#install--update-script
curl -o- https://raw.githubusercontent.com/creationix/nvm/latest/install.sh | bash
cat <<EOT >> ~/.zshrc

# Setup NVM
export NVM_DIR="$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion"  # This loads nvm bash_completion
EOT

nvm install stable

# ruby
brew install gnupg
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
command curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
curl -L https://get.rvm.io | bash -s stable --ruby --rails --autolibs=enable

# r
brew cask install r
brew cask install rstudio

# go
brew install golang
cat <<EOT >> ~/.zshrc

# Setup GoLang
export PATH="\$PATH:/usr/local/go/bin"
export GOPATH="\$HOME/golang"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="\$PATH:\$GOPATH/bin"
export PATH="\$PATH:\$GOROOT/bin"
EOT
# setup things, GOPATH, GOROOT, PATH: https://gist.github.com/vsouza/77e6b20520d07652ed7d

# parsers
brew install yq
brew install jq
brew install protobuf

# sql
brew install mysql
brew install postgresql

######################################
### deployment tools               ###
######################################
brew cask install docker
brew install kubectl

######################################
### cloud services                 ###
######################################

# aws
pip3 install awscli --upgrade --user

# gcloud
curl https://sdk.cloud.google.com | bash
gloud components install kubectl
gcloud auth login

######################################
### scientific                     ###
######################################
# latex
brew cask install mactex

# grammarly
brew cask install grammarly

# skim
brew cask install skim

# alfred
brew cask install alfred

######################################
### prettify                       ###
######################################

# prezto: https://github.com/sorin-ionescu/prezto
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Theming: https://github.com/deka108/etc/blob/master/terminals/README.md

# add the following to zshrc
cat <<EOT >> ~/.zshrc

# Setup prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
EOT

# prezto plugins
# Visit https://github.com/deka108/etc/blob/master/zsh/
# Visit https://github.com/denysdovhan/spaceship-prompt

# fonts
brew tap homebrew/cask-fonts 
# Find powerline fonts here: https://github.com/Homebrew/homebrew-cask-fonts
# Configure default fonts on iterm2

brew cask install font-inconsolata

# colors and theming: 
# https://github.com/deka108/etc/blob/master/terminals/

######################################
### cli tools                      ###
######################################

# tmux
brew install tmux

# tmux plugin: https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Configuring: https://github.com/deka108/etc/blob/master/tmux/

# vim plugins: https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
######################################
### others                         ###
######################################
brew cask install spotify
brew cask install vlc
brew cask install gettext

# screensaver
# https://trends.google.com/trends/hottrends/visualize
# http://osxdaily.com/2014/07/10/set-screen-saver-keyboard-shortcut-mac/

######################################
### worthy references              ###
######################################

# http://sourabhbajaj.com/mac-setup/

cat <<EOT >> ~/.zshrc

# Setup airflow
export AIRFLOW_HOME=~/airflow
EOT

