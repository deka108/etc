check_ancestor () {
	: ${1?"Need the ancestor commit"}
	: ${2?"Need the descendant commit"}
	git merge-base --is-ancestor $1 $2 && echo "${1} is the ancestor" || echo "${1} is not the ancestor"
}
