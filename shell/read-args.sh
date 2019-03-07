: ${1?"Usage: script.sh [REQUIRED_ARG1] [REQUIRED_ARG2] [OPT_ARG3]"}
: ${2?"Usage: script.sh [REQUIRED_ARG1] [REQUIRED_ARG2] [OPT_ARG3]"}

arg1=$1
arg2=$2
arg3="${3:-DEFAULT_VALUE}"

echo $arg1
echo $arg2
echo $arg3
