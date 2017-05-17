typeset -A opts
typeset -a args

opts:parse opts args --args: -- --args '-a -b'

tests:assert-equals "${opts[--args]}" "-a -b"
