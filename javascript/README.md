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
`pyenv install 3.7 2.7 && pyenv global 3.7 2.7`

## Package Manager
#### Choice
[pipenv](https://github.com/pypa/pipenv)

#### Installation
`pip install pipenv` -- so that I can change versions

## Debugging failed installations in Pipenv
https://pipenv.readthedocs.io/en/latest/diagnose/

```pipenv --rm # Deletes the virtualenv
pipenv lock --clear # Removes cache
pipenv clean # Clean unused packages

rm -rf ~/Library/Caches/pipenv
rm -rf ~/.cache/pipenv
rm Pipfile.lock
```
