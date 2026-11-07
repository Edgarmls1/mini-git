#!/bin/bash

BRIT_DIR="$(dirname "$(readlink -f "$0")")"

case $1 in
    "add")
        for ((idx=2; idx<=$#; idx++)); do
            f="${!idx}"
            "$BRIT_DIR/add.sh" "$f"
        done
        ;;
    "commit")
        "$BRIT_DIR/commit.sh" "$2"
        ;;
    "diff")
        "$BRIT_DIR/diff.sh" "$2" "$3"
        ;;
    "init")
        "$BRIT_DIR/init.sh"
        ;;
    "log")
        "$BRIT_DIR/log.sh"
        ;;
    *)
        echo "error"
        ;;
esac
