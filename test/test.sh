#!/bin/bash
set -eu

THIS=$(  readlink --canonicalize $( dirname $0 ) )
export BRAID_HOME=$( readlink --canonicalize $THIS/.. )

if (( ${#} < 1 ))
then
  echo "test.sh: Provide a test!"
  exit 1
fi
TEST=$1
shift

cd $THIS

export PYTHONPATH=${PYTHONPATH:-}:$BRAID_HOME/src
python $TEST ${*}
# Returns exit code from python
