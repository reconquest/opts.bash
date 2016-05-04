typeset -A opts
typeset -a args

tests:eval opts:parse opts args -S: -- -S

tests:assert-stderr "option requires an argument -- 'S'"

tests:eval opts:parse opts args --data: -- --data

tests:assert-stderr "option '--data' requires an argument"
