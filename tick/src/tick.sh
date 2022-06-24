#!/bin/sh
#
# Copyright 2022 cristianrz
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its contributors
# may be used to endorse or promote products derived from this software without
# specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# tick: executes tests and reports results
#

set -eu

pass=0

fail=0

ARG="${1-}"

# _quite command
#
# runs a command without outputting anything to terminal
#
_quiet() {
	case "x$ARG" in
	x-v) "$@" ;;
	x) "$@" >/dev/null 2>&1 ;;
	*) _log_error "unknown argument $ARG" ;;
	esac
}

# _log_error msg
# 
# logs a message to stderr and exits
_log_error() {
	printf 'tick: %s\n' "$*" >&2
	exit 1
}

# _run_test script
#
# prints the 2nd line of the script, which should contain the description,
# runs the script, and updates the pass and fail counters depending on the
# result
_run_test() {
	description="$(
		awk 'NR == 2 { gsub(/^#/,""); print }' "$1"
	)"

	[ -z "$description" ] &&
		_log_error "description missing for $1"

	_quiet printf '\tRunning %s...\n' "$1"

	if ! _quiet sh "$1"; then
		printf '\e[41m\e[30m FAIL \e[39m\e[49m %s\n' "$description"
		: "$((fail += 1))"
		return
	fi

	printf '\e[42m\e[30m PASS \e[39m\e[49m %s\n' "$description"
	: "$((pass += 1))"
}

for _test in ./tests/*; do
	_run_test "$_test"
done

printf '\nRan %d tests, %d passed, %d failed (%d%% pass).\n' \
	"$((pass + fail))" "$((pass))" "$((fail))" \
	"$((100 * pass / (pass + fail)))"
