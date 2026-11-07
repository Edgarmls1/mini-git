#!/bin/bash

if [ -d .brit ]; then
    echo "brit: já inicializado"
else
    mkdir -p .brit/commits
    touch .brit/index .brit/log
    echo "repositório brit inicializado"
fi
