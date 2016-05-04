typeset -A opts
typeset -a args

opts:parse opts args -S: -- -S 1

tests:assert-equals "${opts[-S]}" "1"
tests:assert-equals "${#args[@]}" "1"
tests:assert-equals "${args[0]}" "./run_tests.sh"
