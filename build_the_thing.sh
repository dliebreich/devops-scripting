#!/bin/bash

if [ $# -eq 0 ] || [ $# -gt 2 ]; then
  echo "Usage: $0 ENV_NAME [DEPLOYMENT_NAME] " >&2
  exit 1
fi

env_name=$1
deployment=${2:-cf}

$WORKSPACE/util/bosh_target $env_name

deployment_name=$($WORKSPACE/util/bosh_deployments | grep -Eoh "${deployment}-[0-9a-f]{8,}")

deployment_file="${TMPDIR}/${env_name}$$.yml"

$WORKSPACE/util/bosh_download_manifest $deployment_name $deployment_file

$WORKSPACE/util/bosh_deployment $deployment_file
