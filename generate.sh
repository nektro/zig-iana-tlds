#!/usr/bin/env bash

set -e

data_url="https://data.iana.org/TLD/tlds-alpha-by-domain.txt"
out_path="src/lib.zig"

do_print() {
    echo $@ >> $out_path
}
print_tab() {
    printf "    " >> $out_path
}

echo "// IANA TLD list generated from https://data.iana.org/TLD/tlds-alpha-by-domain.txt" > $out_path
do_print "//"

echo "$(curl -s $data_url)" |
while IFS= read -r line; do
    if [[ ${line:0:1} == "#" ]];
    then
        do_print "//" "$line"
        do_print
        do_print "pub const tlds: []const []const u8 = &.{"
    else
        print_tab
        name=$(echo "$line" | tr '[:upper:]' '[:lower:]')
        do_print "\"$name\","
    fi
done
do_print "};"
