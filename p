#!/usr/bin/env bash

REST_ARGS=$@
PASS_NAME="aw/$(basename $(pwd -P))" 

env $(pass $PASS_NAME | sed '/^#.*$/d') $REST_ARGS

