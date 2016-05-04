typeset -A opts
typeset -a args

opts:parse opts args -d: -- 1 -d2 3

tests:assert-equals "${opts[-d]}" "2"
tests:assert-equals "${#args[@]}" "3"
tests:assert-equals "${args[0]}" "./run_tests.sh"
tests:assert-equals "${args[1]}" "1"
tests:assert-equals "${args[2]}" "3"
