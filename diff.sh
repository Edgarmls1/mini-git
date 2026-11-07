#!/bin/bash

last=$(tail -n1 .brit/log)
for f in $(cat .brit/index); do
    diff -u ".brit/commits/$last/files/$f" "$f"
done
