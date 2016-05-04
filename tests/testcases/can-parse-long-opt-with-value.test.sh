typeset -A opts
typeset -a args

opts:parse opts args --delta: -- 1 --delta=2 3

tests:assert-equals "${opts[--delta]}" "2"
tests:assert-equals "${#args[@]}" "3"
tests:assert-equals "${args[0]}" "./run_tests.sh"
tests:assert-equals "${args[1]}" "1"
tests:assert-equals "${args[2]}" "3"

opts:parse opts args --delta: -- 1 --delta 2 3

tests:assert-equals "${opts[--delta]}" "2"
tests:assert-equals "${#args[@]}" "3"
tests:assert-equals "${args[0]}" "./run_tests.sh"
tests:assert-equals "${args[1]}" "1"
tests:assert-equals "${args[2]}" "3"
