#!/usr/bin/env bash

set -e

the_diff=$(git diff src/lib.zig | grep '^[-|+]' | grep -v 'src/lib.zig')
len=$(echo "$the_diff" | wc -l)

git config --global user.name 'Meghan Denny'
git config --global user.email 'nektro@users.noreply.github.com'

if (( $len > 2 ))
then
    echo 'found changes'
    git add src/lib.zig
    git commit -m 'Automated update'
    git push origin master
fi
