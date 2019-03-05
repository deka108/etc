## Version Management
#### Choice
[pyenv](https://github.com/pyenv/pyenv)

#### Installation
`brew install pyenv`

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
