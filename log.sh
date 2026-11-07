#!/bin/bash

[ -s .brit/log ] || { echo "No logs found"; exit 0; }

tac .brit/log | while read -r id; do
    echo "commit $id"
    echo "Date: $(cat .brit/commits/$id/date)"
    echo "    $(cat .brit/commits/$id/message)"
    echo
done
