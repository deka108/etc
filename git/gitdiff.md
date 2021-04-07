### Preferred Tool
`vimdiff`

#### Setup

```
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
```

#### Commands
https://gist.github.com/mattratleph/4026987

#### Exit all open diffs
Edit .gitconfig:

```
[difftool]
    # Be able to abort all diffs with `:cq` or `:cquit`
    trustExitCode = true
```
