typeset -A opts
typeset -a args

opts:parse opts args --help -- 1 2 3

tests:assert-equals "${opts:-empty}" "empty"
tests:assert-equals "${#args[@]}" "4"
tests:assert-equals "${args[0]}" "./run_tests.sh"
tests:assert-equals "${args[1]}" "1"
tests:assert-equals "${args[2]}" "2"
tests:assert-equals "${args[3]}" "3"

opts:parse opts args --help -- --help 1 2 3

tests:assert-equals "${#opts[@]}" "1"
tests:assert-equals "${opts[--help]}" "true"
tests:assert-equals "${#args[@]}" "4"
tests:assert-equals "${args[0]}" "./run_tests.sh"
tests:assert-equals "${args[1]}" "1"
tests:assert-equals "${args[2]}" "2"
tests:assert-equals "${args[3]}" "3"
