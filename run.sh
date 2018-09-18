#!/bin/bash

# capture the path to this file so we can call on relative scrips without
# having to be in this dir to do it.
set -e
PREFIXPATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

mkdir -p ${PREFIXPATH}/reports

echo 
echo "AWS_DEFAULT_REGION= $AWS_DEFAULT_REGION"
echo "$AWS_REGION= $AWS_REGION"
echo "AWS_ACCESS_KEY_ID= $AWS_ACCESS_KEY_ID"
echo "AWS_SECRET_ACCESS_KEY= $AWS_SECRET_ACCESS_KEY"
echo "AWS_SESSION_TOKEN= $AWS_SESSION_TOKEN"
echo
echo "args are: $@ "
docker run --name scout2karl --rm -v ${PREFIXPATH}/reports:/output -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION -e AWS_REGION=$AWS_REGION -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN scout2-karl $@
