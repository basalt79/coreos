#!/bin/bash

set -eo pipefail

FCOSFILES=./fcos*.yaml

function transpileFiles {
  for f in $1
  do
    echo "Transpiling $f config..."
    ./butane --pretty --strict < $f > ${f%.*}.ign
  done
}
function getConfigTranspiler {
  if [ ! -f ./butane ]; then
    curl -sL https://github.com/coreos/butane/releases/download/v0.21.0/butane-x86_64-unknown-linux-gnu -o ./butane
    chmod +x ./butane
  fi
}

getConfigTranspiler
transpileFiles "$FCOSFILES"