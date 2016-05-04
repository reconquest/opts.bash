Missing very simple option parser for bash.

# Installation

```bash
source ${0%/*}/vendor/github.com/reconquest/opts.bash/opts.bash
```

# Usage

```bash
declare -A opts
declare -a args

opts:parse opts args -a -b -c --long-option1 --long-option2 -- "${@}"

echo ${opts[-a]:-empty}
echo ${opts[-b]:-empty}
echo ${opts[-c]:-empty}
echo ${opts[--long-option1]:-empty}
echo ${opts[--long-option2]:-empty}

echo ${args[@]}
```

# Reference

```bash
opts:parse <opts-var> <args-var>
           (-<short-opt-name>[:[:]] | --<long-opt-name>[:[:]])... -- "${@}"
```

Semantics of using `:` same as in `getopt`:

* `:` after option name specify, that option requires argument;
* `::` after option name specify, that option may have argument;
