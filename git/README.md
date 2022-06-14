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

// if the above fails
patch -p1 < [filename].patch
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

## Removing files or redacting contents across git history

Preferred tool: [bfg](https://rtyley.github.io/bfg-repo-cleaner/)

### Installation
```
brew install bfg
```

### Setup

1. Remove the sensitive contents / files from the current repo, create a new commit, and push it.
2. Clone the bare repo of the repo into `[repo_name].git`
```
git clone --mirror [git_repo_address]
```

### How to Redact Contents

1. Add the redacted contents to a file, eg: `password.txt`. We can use [regex too](https://gist.github.com/w0rd-driven/60779ad557d9fd86331734f01c0f69f0):
```
PASSWORD1                       # Replace literal string 'PASSWORD1' with '***REMOVED***' (default)
PASSWORD2==>examplePass         # replace with 'examplePass' instead
PASSWORD3==>                    # replace with the empty string
regex:password=\w+==>password=  # Replace, using a regex
regex:\r(\n)==>$1               # Replace Windows newlines with Unix newlines
@mevers303
```
2. Run `bfg` on the bare clone.
```
bfg --replace-text password.txt [repo_name].git
```
3. Run `git reflog` on the bare clone.
```
cd [repo_name].git
git reflog expire --expire=now --all && git gc --prune=now --aggressive
```
4. Push the rewritten history to remote.
```
git push --force
```

### How to Delete Files

1. Run `bfg` on the filenames that we want to delete
```
bfg --delete-files id_{dsa,rsa} [repo_name].git
```
2. Same steps as redaction after the `bfg` operation.


## Find String Pattern on Current Git branch

```
git grep -E [text]
```

Parameters:
- `-l`: file-only.

## Find and Replace String Pattern on Current Git branch
[Link to ref](https://remarkablemark.org/blog/2020/07/12/git-grep-replace/)

```
# find and replace contents
git grep -l 'original_text' | xargs sed -i '' -E 's/original_text/new_text/g'

# find and replace contents with exception
git grep -l -e "$MATCH" --and --not -e "$EXCLUDE" | xargs sed -i "" -E "/$EXCLUDE/! s/$MATCH/$REPLACE/g"
```

Handle whitespaces in filenames:
```
[grepping command] | tr \\n \\0 | xargs -0 [xargs cmd]
```

## Search Git History for a string
[Link to thread](https://stackoverflow.com/questions/4468361/search-all-of-git-history-for-a-string)

```
git log -S [text]
```

`git log` parameters:
- `-p`: show the diffs
- `-G`: use regex content
- `-S`: string content
- `--branches`: selected branches

## Show the file on a previous commit version

```
git show [REVISION]:[path/to/file]
```