# git

## Setup

### Installations

`brew install git`

### Setup GitHub SSH

Generate SSH Key and Adding to GitHub: https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

## Useful commands

### Commits created by me
```
git log --author="<$(git config user.email)>"
```

### My branches
```
# branches that are merged
git branch --merged master

# branches that aren't merged
git branch --no-merged master
```

### Delete local and remote branches
```
while read in; do git push origin -d $in; git branch -D $in; done < delete-branch.txt
```

### Pretty Print Git Log Tree

```git log --graph --oneline --decorate --all```

![Git log dog](https://i.stack.imgur.com/ElVkf.jpg)

**References:**
- https://stackoverflow.com/questions/1057564/pretty-git-branch-graphs?answertab=votes#tab-top

### Git Config
https://gist.github.com/pksunkara/988716

### Advanced Git
https://www.atlassian.com/git/tutorials/advanced-overview

### Git Diff
https://stackoverflow.com/questions/3713765/viewing-all-git-diffs-with-vimdiff
Vimdiff: https://vim.rtorr.com/

### Working with Remote
https://stackoverflow.com/questions/3471827/how-do-i-list-all-remote-branches-in-git-1-7

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
