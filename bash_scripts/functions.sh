# generate .gitignore file -- gi [project]
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# update pip installations
function pipupdate(){
  pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
}
