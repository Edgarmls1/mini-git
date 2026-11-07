#!/bin/bash

INDEX=".brit/index"

case $1 in
    "list") cat "$INDEX" 2>/dev/null ;;
    *)
        if [ ! -f "$1" ]; then
            echo "brit: '$1' não existe" >&2
            exit 1
        fi
        touch "$INDEX"
        grep -qxF -- "$1" "$INDEX" || echo "$1" >> "$INDEX"
        ;;
esac
