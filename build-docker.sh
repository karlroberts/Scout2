#!/bin/bash

# capture the path to this file so we can call on relative scrips without
# having to be in this dir to do it.
set -e
PREFIXPATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

rm -rf ${PREFIXPATH}/reports
mkdir -p ${PREFIXPATH}/reports

docker build -t scout2-karl ${PREFIXPATH}
