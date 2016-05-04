typeset -A opts
typeset -a args

tests:ensure opts:parse opts args --

tests:assert-equals ${opts:-empty} empty
tests:assert-equals ${args:-empty} empty

