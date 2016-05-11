source ${BASH_SOURCE[0]%/*}/vendor/github.com/reconquest/types.bash/types.bash

function opts:parse() {
    if [ $# -lt 1 ]; then
        echo "opts:parse: first argument should be name of the variable to"
        echo "return parsed options"
        return 3
    fi >&2

    if [ $# -lt 2 ]; then
        echo "opts:parse: second argument should be name of the variable to"
        echo "return positional arguments"
        return 3
    fi >&2

    local _opts=$1
    local _args=$2

    if ! types:is-assoc-array $_opts; then
        echo "opts:parse: first argument should be name of the variable"
        echo "that is declared as assoc array with 'declare -A' or 'local -A'"
        return 4
    fi >&2

    if ! types:is-array $_args; then
        echo "opts:parse: first argument should be name of the variable that"
        echo "is declared as array with 'declare -a' or 'local -a'"
        return 4
    fi >&2

    shift 2

    local _short_opts=()
    local _long_opts=()
    local _all_opts=()
    local -A _opts_with_arg

    while [ $# -gt 0 ]; do
        case "$1" in
            --)
                break
                ;;
            -*:)
                _opts_with_arg[$1]=true
                ;;&
            --*)
                _long_opts+=(${1#--*})
                ;;
            -*)
                _short_opts+=(${1#-*})
                ;;
            *)
                echo "opts:parse: unexpected argument: '$1'" >&2
                return 1
                ;;
        esac

        _all_opts+=($1)

        shift
    done

    if [ "$1" != "--" ]; then
        echo "opts:parse: -- must present and delimit options from incoming"
        echo "args string"
        return 2
    fi >&2

    shift

    eval set -- $( \
        getopt \
            -o "$(printf "%s" "${_short_opts[@]:-}")" \
            ${_long_opts:+-l "$(printf "%s," "${_long_opts[@]}")"} \
            -- "$0" \
            "${@}" \
        )

    eval $_opts='()'

    local _opt_name
    while [ $# -gt 0 ]; do
        case "$1" in
            --)
                shift
                break
                ;;
            -*)
                _opt_name="$1"
                if [ ! "${_opts_with_arg[$_opt_name]:-}" ]; then
                    eval $_opts\[$_opt_name\]='$((' \
                        \${$_opts\[$_opt_name\]:-0}+1 \
                    '))'
                fi
                ;;
            *)
                eval $_opts\[$_opt_name\]=$(printf "%q" "$1")
                ;;
        esac

        shift
    done

    eval $_args='("${@}")'
}
