#!/bin/sh
#
# Extracts a compressed file in different formats
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

die() {
	printf "extract: %s\n" "$@" >&2
	exit 1
}

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $(basename "$0") [OPTION] [FILE]
Extracts a compressed file in different formats.

	--help    display this help and exit"

case "$1" in
"--help")
	printf '%s\n' "$usage"
	exit
	;;
esac

if test "$#" -ne 1; then
	printf '%s\n' "$usage"
	exit 1
fi

case "$1" in
*.tbz2 | *.tar.bz2) exec tar fjvx "$@" ;;
*.tar | *.tar.xz) exec tar fvx "$@" ;;
*.tgz | *.tar.gz) exec tar fvxz "$@" ;;
*.7z) exec 7za x "$@" ;;
*.iso) exec 7z x "$@" ;;
*.Z) exec uncompress "$@" ;;
*.bz2) exec bunzip2 "$@" ;;
*.gz) exec gunzip "$@" ;;
*.rar) exec unrar e "$@" ;;
*.zip) exec unzip "$@" ;;
*) die "'$*' cannot be extracted" ;;
esac
