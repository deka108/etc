# git

## Setup

### Installations

`brew install git`

### Setup GitHub SSH

Generate SSH Key and Adding to GitHub: https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

## Useful commands

### Git logs

Ref: https://stackoverflow.com/questions/462974/what-are-the-differences-between-double-dot-and-triple-dot-in-git-com

```
# commits created by me
git log --oneline --author="<$(git config user.email)>"

# show all the commits that commit2 has that commit1 doesn't
git log [commit1]..[commit2]

# show all commits that (commit1 has that commit2 doesn't) and the commits that (commit2 has that commit1 doesn't)
git log [commit1]...[commit2]
```

![image](https://user-images.githubusercontent.com/7682712/114791692-e9c8d980-9d54-11eb-893f-f38268683a44.png)
![image](https://user-images.githubusercontent.com/7682712/114791706-ed5c6080-9d54-11eb-901a-2010f3ee6e72.png)

### My branches
```
# branches that are merged
git branch --merged master

# branches that aren't merged
git branch --no-merged master
```

### Find the first commit of the branch

```
// the commit where the branch is forked
git merge-base --fork-point master HEAD

// the start commit of the current branch 
git log master..HEAD --oneline | tail -1
```

### Delete local and remote branches
```
while read in; do git push origin -d $in; git branch -D $in; done < delete-branch.txt
```

### Checkout to another user's branch
```
git remote add [user] [ssh fork]
git checkout --track [user]/[branch]
git pull [user] [branch]
```

### Git Diff

Ref: https://stackoverflow.com/questions/7251477/what-are-the-differences-between-double-dot-and-triple-dot-in-git-dif

```
# git diff without dots is the same as diffs with two dots
git diff [branch]

# diffs from commit1 to commit2
git diff [commit1]..[commit2]

# diffs between commit1 & commit2 starting from lowest common ancestor in both commits
git diff [commit1]...[commit2]

git diff [branch] -- "*.[ext]" "*[filename]"
```
![image](https://user-images.githubusercontent.com/7682712/114792106-b6d31580-9d55-11eb-9a5b-826f4db2b344.png)

![image](https://user-images.githubusercontent.com/7682712/114792164-ce120300-9d55-11eb-8196-dcb7a9c381b8.png)


### Patch and Apply
```
// create patch
git diff [branch] ... > [filename].patch

// apply patch
git apply [filename].patch
```

### Merge squash
```
git merge --squash [branch]
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
