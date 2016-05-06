typeset -A opts
typeset -a args

opts:parse opts args -u: -h -- -u 1 -h 2 3

tests:assert-equals "${opts[-u]}" "1"
tests:assert-equals "${opts[-h]}" "1"
tests:assert-equals "${#args[@]}" "3"
tests:assert-equals "${args[0]}" "./run_tests.sh"
tests:assert-equals "${args[1]}" "2"
tests:assert-equals "${args[2]}" "3"
