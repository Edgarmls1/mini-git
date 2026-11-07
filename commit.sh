#!/bin/bash

[ -d .brit ] || { echo "brit: não é um repositório" >&2; exit 1; }

msg="$1"
[ -n "$msg" ] || { echo "uso: brit commit \"mensagem\"" >&2; exit 1; }

if [ ! -s .brit/index ]; then
    echo "nada para commitar" >&2
    exit 1
fi

# ID do commit: hash dos conteúdos + timestamp
id=$(cat $(cat .brit/index) | sha1sum | cut -c1-7)-$(date +%s)
dir=".brit/commits/$id"
mkdir -p "$dir/files"

while IFS= read -r file; do
    mkdir -p "$dir/files/$(dirname "$file")"
    cp "$file" "$dir/files/$file"
done < .brit/index

echo "$msg" > "$dir/message"
date > "$dir/date"
echo "$id" >> .brit/log
: > .brit/index   # limpa a staging area

echo "[$id] $msg"
