typeset -A opts
typeset -a args

tests:not tests:ensure opts:parse opts args -S: -- -S
tests:assert-stderr 'getopt: option requires an argument'
