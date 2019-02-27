## Debugging failed installations
https://pipenv.readthedocs.io/en/latest/diagnose/

```pipenv --rm # Deletes the virtualenv
pipenv lock --clear # Removes cache
pipenv clean # Clean unused packages

rm -rf ~/Library/Caches/pipenv
rm -rf ~/.cache/pipenv
rm Pipfile.lock
```
