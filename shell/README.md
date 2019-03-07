# bash

### If Commands and Flags

**References:**
- https://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html

### Parameter Substitutions

#### References

- https://unix.stackexchange.com/questions/122845/using-a-b-for-variable-assignment-in-scripts
- https://wiki.bash-hackers.org/syntax/pe
- http://www.tldp.org/LDP/abs/html/parameter-substitution.html
- https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html

![TL; DR](https://i.stack.imgur.com/T2Fp8.png)

### Special Parameters

**References:**
- https://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables
- https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html

### Parsing Command Line Arguments

**References:**
- https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

### Colon

**References:**
- https://stackoverflow.com/questions/3224878/what-is-the-purpose-of-the-colon-gnu-bash-builtin
- https://stackoverflow.com/questions/32342841/colon-at-the-beginning-of-line-in-docker-entrypoint-bash-script?noredirect=1&lq=1

### Test if Command contains certain String

```bash
[[ $(command | grep -q [search-text]) ]] && { echo "text exist in output" }
[[ $(command | grep -q [search-text]) ]] || { echo "text doesn't exist in output" }
```

https://stackoverflow.com/questions/12375722/how-do-i-test-in-one-line-if-command-output-contains-a-certain-string
