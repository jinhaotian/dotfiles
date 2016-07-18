#!/bin/sh
export PROMPT_COMMAND="printf '\e]0;${USER}@${HOSTNAME}:${PWD} \7\n'"
