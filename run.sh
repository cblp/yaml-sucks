#!/bin/bash
set -eu
set -o pipefail

( echo '# YAML sucks.'
  echo
  echo '| YAML source | yaml2json.hs | yaml2json.py |'
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
) > README.md
