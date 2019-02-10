#!/bin/bash

## https://docs.openshift.com/container-platform/3.7/admin_guide/pruning_resources.html

token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImltYWdlLXBydW5lci10b2tlbi0yeHpkNCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJpbWFnZS1wcnVuZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiJlNWM2OTUzNS1jZTIzLTExZTctYWFiYS0wMDUwNTZiODIwNDgiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6ZGVmYXVsdDppbWFnZS1wcnVuZXIifQ.TTkOXG7jVFl2OOnLmet3-cQ2gNsSSy0x-AYZqOk0zDW2EiBMtUnM8NpiACHhciXA-oMz5JYntiDPFYsNj8dsDhL3eH-oPqmQ2t6S9ZMJ4sCKJxCFtFHqj8KwQQ-UPqZIzaL31DvrpuAHkDIW9UCFcxiKKxAD6I7LoSxWx-f6IIBV56Cq42t8g_gALz14D0lpTSbaDQvrtoegdLULJcB5S1QKnWHPCAQN1_zejvXuQb0dmXtA0AluQ-O4CiYAtjgGqnQOUNQOfIyPK4tt_dN2EVpw1gc6KMjeVlaazTMtTnFjjuWj2ACvsbZ_Z_Aom2jyHePLJGDejaMaaT7UHpACbQ


/usr/bin/oc adm --token=${token} prune deployments --orphans=true --keep-complete=1 --keep-failed=1 --keep-younger-than=60m --confirm

/usr/bin/oc adm --token=${token} prune builds      --orphans=true --keep-complete=1 --keep-failed=1 --keep-younger-than=60m --confirm

/usr/bin/oc adm --token=${token} prune images      --keep-tag-revisions=5 --keep-younger-than=60m --confirm
