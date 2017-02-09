#!/bin/bash

set -euo pipefail

source ${0%/*}/vendor/github.com/reconquest/import.bash/import.bash

import:use github.com/reconquest/tests.sh

tests:main -d tests/testcases -s tests/local-setup.sh "${@:--A}"
