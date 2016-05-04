#!/bin/bash

set -euo pipefail

source ${0%/*}/vendor/github.com/reconquest/tests.sh/tests.sh

cd tests/

tests:main -d testcases -s local-setup.sh "${@:--A}"
