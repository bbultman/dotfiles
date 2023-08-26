#!/usr/bin/env bash

if [ $# -eq 0 ]; then
	echo "No arguments passed, nothing to do."
	exit 1
fi

REST_ARGS=$@
PASS_PREFIX="aw"
PASS_ENTRY=$(basename $(pwd -P))
PASS_NAME="$PASS_PREFIX/env/$PASS_ENTRY"

pass $PASS_NAME &> /dev/null

EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
	echo "No pass entry found for \"$PASS_NAME\", exiting."
	exit 1
fi

env $(pass $PASS_NAME | sed '/^#.*$/d') $REST_ARGS

