#!/usr/bin/env bash
set -euo pipefail

PROGRAM_NAME=clitsrec

# a name for this session based on the working directory and start time
SESSION_NAME="$(basename "$PWD")-$(date -Is)"

# store logs under the XDG Base Directory for user-specific data
# e.g. ~/.local/share/clitsrec/project-dir-name-2025-08-03T22:42:00-04:00/
LOG_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/$PROGRAM_NAME/$SESSION_NAME"
mkdir -p "$LOG_DIR"

# use the argument list as the command to run, or run "gemini" by default
COMMAND="${*:-gemini}"

echo "Running command \"$COMMAND\" in terminal session with output being logged to \"$LOG_DIR/script.out\"."

script --quiet --flush \
       --command "$COMMAND" \
       --log-timing "$LOG_DIR/script.tm" \
       --log-out "$LOG_DIR/script.out"

echo "Session ended."
echo
echo "To display the output log:"
echo "% less -R $LOG_DIR/script.out"
echo
echo "To replay the session:"
echo "% scriptreplay $LOG_DIR/script.tm $LOG_DIR/script.out"

