#!/bin/bash
set -eu
set -o pipefail

function fix_newlines {
    sed --null-data 's/\n$//;s/\n/<br>/g'
}

function run {
    prog="$1"
    input="$2"

    out_file="/tmp/yaml-sucks.out.json"
    err_file="/tmp/yaml-sucks.err.txt"

    $prog < $input > $out_file 2> $err_file ||:
    (   if [ -s $err_file ]; then
            echo -n ':x: '
            cat $err_file
        else
            cat $out_file
        fi
    ) | fix_newlines
}

(   echo '# YAML sucks.'
    echo
    echo '| YAML source | yaml2json.hs | yaml2json.py | yaml2json.pl |'
    echo '|---|---|---|---|'
    for input in inputs/*.yaml; do
        echo -n '| '
        run cat $input
        echo -n ' | '
        run ./yaml2json.hs $input
        echo -n ' | '
        run ./yaml2json.py $input
        echo -n ' | '
        run ./yaml2json.pl $input
        echo    ' |'
    done
) > README.md
