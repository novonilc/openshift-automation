#!/bin/bash

# Check if authenticated with OpenShift
if [[ ! "$(oc whoami)" ]]; then
  echo "ERROR: Log in to OpenShift Cluster first!"
  exit
fi

# Get project creation date from each one.
for project in $(oc projects -q)
do
    echo "$(oc get project ${project} -o jsonpath='{ .metadata.creationTimestamp }') = $project"
done
