typeset -A opts
typeset -a args

opts:parse opts args -v -- -v -v -v

tests:assert-equals "${opts[-v]}" "3"

opts:parse opts args -v -- -vvv

tests:assert-equals "${opts[-v]}" "3"
