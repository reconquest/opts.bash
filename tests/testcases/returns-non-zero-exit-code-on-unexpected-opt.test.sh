typeset -A opts
typeset -a args

tests:eval opts:parse opts args -a -- -b

tests:assert-fail
