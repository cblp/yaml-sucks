#!/bin/bash
set -eu
set -o pipefail

function fix_newlines {
    sed --null-data 's/\n$//;s/\n/<br>/g'
}

( echo '# YAML sucks.'
  echo
  echo '| YAML source | yaml2json.hs | yaml2json.py | yaml2json.pl |'
  echo '|---|---|---|---|'
  for input in inputs/*.yaml; do
      echo -n '| '
      cat $input | fix_newlines
      echo -n ' | '
      ./yaml2json.hs < $input | fix_newlines
      echo -n ' | '
      ./yaml2json.py < $input | fix_newlines
      echo -n ' | '
      ./yaml2json.pl < $input | fix_newlines
      echo    ' |'
  done
) > README.md
