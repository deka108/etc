# git

## Setup

### Installations

`brew install git`

### Setup GitHub SSH

Generate SSH Key and Adding to GitHub: https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

## Useful commands

### Pretty Print Git Log Tree

```git log --graph --oneline --decorate --all```

![Git log dog](https://i.stack.imgur.com/ElVkf.jpg)

**References:**
- https://stackoverflow.com/questions/1057564/pretty-git-branch-graphs?answertab=votes#tab-top

### .gitignore

#### Choice

[gitignore.io](https://www.gitignore.io/)

#### Setup

Ref: https://docs.gitignore.io/install/command-line

```bash
echo "function gi() { curl -sLw "\n" https://www.gitignore.io/api/\$@ ;}" >> \
~/.zshrc && source ~/.zshrc
```

#### Usage

After setting up gitignore for shell, we can generate .gitignore file automatically by running `gi [template]`
