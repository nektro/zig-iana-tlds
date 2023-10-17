#!/usr/bin/env bash

set -u

while true
do
    ./generate.sh
    the_diff=$(git diff src/lib.zig | grep '^[-|+]' | grep -v 'src/lib.zig')
    len=$(echo "$the_diff" | wc -l)

    if (( $len > 2 ))
    then
        git add src/lib.zig
        git commit -m "Automatic update"
        git fetch
        git pull --rebase
        git push origin
    fi

    sleep 30m
done
