#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PANE_PID="$1"

exit_safely_if_empty_ppid() {
	if [ -z "$PANE_PID" ]; then
		exit 0
	fi
}

full_command() {
	ps -ao "ppid,args" |
		awk -v pid="$PANE_PID" '$1 == pid { sub(/^[[:space:]]*[0-9]+[[:space:]]+/, ""); print }'
}

main() {
	exit_safely_if_empty_ppid
	full_command
}
main
