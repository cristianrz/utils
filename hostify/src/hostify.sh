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
# hostify: checks IP's responding to ping against a database and adds entries
#   as needed

set -eu

_PREFIX="$(
	cd "$(dirname "$0")/.."
	printf '%s' "$PWD"
)"
_PROGRAM="$(basename "$0")"
_DB="$_PREFIX/share/hostify/hostify.db"
_CONF="$_PREFIX/etc/hostify.conf"

# _log_err msg
#
# logs an error to stderr
_log_err() {
	printf '%s: %s\n' "$_PROGRAM" "$*" >&2
}

# _log_err msg
#
# logs and error to stderr and exits
_log_fatal() {
	_log_err "$*"
	exit 1
}

# _assert condition
#
# checks that condition is true otherwise exits
_assert() {
	[ "$@" ] || _log_fatal "assertion failed: $*"
}

# _ping_sweep ip_start
#
# ip sweeps the range of ips starting with ip_start (e.g. 192.168.1)
_ping_sweep() {
	for i in $(seq 1 254); do
		timeout 2 ping -c 1 "${1}.${i}" 2>&1 |
			awk '/bytes from/ {gsub(/:/,""); print $4 }' &
	done
}

# _create_if_missing file contents
#
# if a file does not exists, creates it and appends contents
_create_if_missing() {
	file="$1"
	shift

	if [ ! -f "$file" ]; then
		printf '%s\n' "$*" >"$file"
	fi
}

mkdir -p "$_PREFIX/share/hostify" "$_PREFIX/etc"
_create_if_missing "$_DB"
_create_if_missing "$_CONF" 'IP_PREFIX=192.168.1'

. "$_CONF"

_PINGS="$(mktemp)"
_DB_NEW="$(mktemp)"

trap 'rm -f "$_PINGS" "$_DB_NEW"' 2 EXIT

echo "ping sweeping..."
_ping_sweep "$IP_PREFIX" >"$_PINGS"
wait

_awk_p='NF == 2 {
	name[$1]=$2	
	next
}

NF == 1 {
	if (name[$1] == "") {
		printf("Found new IP %s, do you want to add it to the db? (name/N): ", $1)	
		getline ans < "-"

		if (ans == "n" || ans == "N" || ans == "no" || ans == "NO" || ans == "" ) {
			next
		}

		printf("%s %s\n", $1, ans) >> db_new
	} else {
		printf("found known IP %s (%s)\n", $1, name[$1])
	}

	next
}'

awk -v db_new="${_DB_NEW}" "$_awk_p" "$_DB" "$_PINGS"

cat "$_DB_NEW" >>"$_DB"

exit 0
