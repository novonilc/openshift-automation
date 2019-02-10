#!/bin/bash

BACKUP_DIR_WITH_DATE="projects"_$(date +%F)

# Check if authenticated with OpenShift
if [[ ! "$(oc whoami)" ]]; then
  echo "ERROR: Log in to OpenShift Cluster first!"
  exit
fi


# Backup all resources of every project
for project in $(oc get projects --no-headers | awk '{print $1}')
do
    echo -n "Backing up project $project... "

    mkdir -p ${BACKUP_DIR_WITH_DATE}/${project}

    oc export all            -o yaml -n ${project}               > ${BACKUP_DIR_WITH_DATE}/${project}/project.yaml 2>/dev/null
    oc get    rolebindings   -o yaml --export=true -n ${project} > ${BACKUP_DIR_WITH_DATE}/${project}/rolebindings.yaml 2>/dev/null
    oc get    serviceaccount -o yaml --export=true -n ${project} > ${BACKUP_DIR_WITH_DATE}/${project}/serviceaccount.yaml 2>/dev/null
    oc get    secret         -o yaml --export=true -n ${project} > ${BACKUP_DIR_WITH_DATE}/${project}/secret.yaml 2>/dev/null
    oc get    pvc            -o yaml --export=true -n ${project} > ${BACKUP_DIR_WITH_DATE}/${project}/pvc.yaml 2>/dev/null

    echo "done."
done
