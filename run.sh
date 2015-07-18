#!/bin/bash
set -eu
set -o pipefail

function run {
    prog="$1"
    input="$2"

    out_file="/tmp/yaml-sucks.out.json"
    err_file="/tmp/yaml-sucks.err.txt"

    $prog < $input > $out_file 2> $err_file ||:
    (   if [ -s $err_file ]; then
            echo ':x:'
            echo -n '<code>'
            cat $err_file | sed -z 's/\n$//'
            echo -n '</code>'
        else
            echo -n '<pre><code>'
            cat $out_file
            echo -n '</code></pre>'
        fi
    )
}

(   echo '# YAML sucks.'
    echo
    echo '<table>'
        echo '<tr>'
            echo '<th>YAML source</th>'
            echo '<th>yaml2json.hs</th>'
            echo '<th>yaml2json.py</th>'
            echo '<th>yaml2json.pl</th>'
        echo '</tr>'
        for input in inputs/*.yaml; do
            echo '<tr>'
                echo '<td>'
                    run cat $input
                echo '</td><td>'
                    run ./yaml2json.hs $input
                echo '</td><td>'
                    run ./yaml2json.py $input
                echo '</td><td>'
                    run ./yaml2json.pl $input
                echo '</td>'
            echo '</tr>'
        done
    echo '</table>'
) > README.md
