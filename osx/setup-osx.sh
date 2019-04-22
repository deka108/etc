#!/usr/bin/env bash

######################################
### constants and definitions      ###
######################################

PY3_VERSION=3.7.3
PY2_VERSION=2.7.16

######################################
### the basics                     ###
######################################

# install xcode terminal
xcode-select --install

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew cask

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
git config --global --edit # change user

# zsh
brew install zsh

######################################
### programming languages          ###
######################################

# python
brew install pyenv
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshenv
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
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install stable

# ruby
brew install gnupg
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -L https://get.rvm.io | bash -s stable --ruby --rails --autolibs=enable

# r
brew install r
brew cask install rstudio

# go
brew install golang

# protobuf
brew install protobuf

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

# add the following to zshrc
# source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# fonts
brew tap homebrew/cask-fonts 
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

# https://github.com/deka108/etc/blob/master/tmux/

# vim plugins: https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# prezto plugins

######################################
### worthy references              ###
######################################

# http://sourabhbajaj.com/mac-setup/
