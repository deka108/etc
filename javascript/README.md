## Version Management
#### Choice
[nvm](https://github.com/creationix/nvm)

#### Installation
```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# This loads nvm, should be added to ~/.zshrc or ~/.bashrc or ~/custom.zsh
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
```

#### Setup
`nvm install node && nvm use node`

## Package Manager
#### Choice
[yarn](https://github.com/yarnpkg/yarn)

#### Installation
`brew install yarn --ignore-dependencies`
