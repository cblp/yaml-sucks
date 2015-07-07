#!/bin/bash
set -eu
set -o pipefail

echo '| YAML | read from Haskell | read from Python |'
echo '|---|---|---|'
for input in inputs/*.yaml; do
    echo -n '| '
    echo -n $(<$input)
    echo -n ' | '
    echo -n $(./yaml2json.hs < $input)
    echo -n ' | '
    echo -n $(./yaml2json.py < $input)
    echo    ' |'
done
