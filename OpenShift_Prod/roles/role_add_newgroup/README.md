Purpose
=======

Add and sync AD groups in OpenShift

Pre-requisites for creating project in Dev:
===========================================

1. oc client installed in your Linux uservm
2. Please install oc client if its not installed from following https://confluence.ca.bestbuy.com/display/OCPT/OC+Clients
3. Vault password : L3 OCP team / Keypass

OpenShift Environments
----------------------

| Environment| DataCenter |                            URL                             |
| -----------|------------|------------------------------------------------------------|
| CA-DEV     | Telus      | https://openshift-public-portal.dev-ocp.ca.bestbuy.com:8443|
| CA-PROD    | Telus      | https://master-vidc.prod-ocp.ca.bestbuy.com:8443           |
| US-DR      | Bloomington| https://master-bdc.prod-ocp.na.bestbuy.com:8443            |
| US-PROD    | Denver     | https://master-hdc.prod-ocp.na.bestbuy.com:8443            |

How to Execute?
===============

`````
$ cd $HOME
$ wget https://bitbucketdev.ca.bestbuy.com/projects/OI/repos/openshift_platform_automation/raw/OpenShift_Prod/configs/ssh.cfg?at=refs%2Fheads%2Fdev
$ wget https://bitbucketdev.ca.bestbuy.com/projects/OI/repos/openshift_platform_automation/raw/OpenShift_Prod/configs/ansible.cfg?at=refs%2Fheads%2Fdev
`````

Edit the ssh.cfg file
Note : Replace username with your NT id

`````
Host *
  ProxyCommand    ssh -W %h:%p <username>@alp01ecdeploy.ca.bestbuy.com
Host *
  ControlMaster   auto
  ControlPath     ~/.ssh/mux-%r@%h:%p
  ControlPersist  15m

$ cd $HOME
`````

How to Execute?
===============
`````
$ cd $HOME
$ git clone ssh://git@bitbucketdev.ca.bestbuy.com:7999/oi/openshift_platform_automation.git
$ cd openshift_platform_automation/OpenShift_Prod/configs
`````

# Dev

```
$  ansible-playbook -i ~/openshift_platform_automation/OpenShift_Prod/inventory/hosts -l dtl20ocpcma01.ca.bestbuy.com -v  ~/openshift_platform_automation/OpenShift_Prod/roles/role_add_newgroup/pb_add_groups.yaml --ask-vault-pass -e ca_dev=true -k
```

# CA-Prod

```
$ ansible-playbook -i ~/openshift_platform_automation/OpenShift_Prod/inventory/hosts -l pdl20ocpmma01.ca.bestbuy.com  -v  ~/openshift_platform_automation/OpenShift_Prod/roles/role_add_newgroup/pb_add_groups.yaml --ask-vault-pass -e ca_prod=true -k
```

# US-PROD
```
$ ansible-playbook -i ~/openshift_platform_automation/OpenShift_Prod/inventory/hosts -l pdl10ocpcma01.na.bestbuy.com  -v  ~/openshift_platform_automation/OpenShift_Prod/roles/role_add_newgroup/pb_add_groups.yaml --ask-vault-pass -e us_prod=true -k
```

# US-DR
```
$ ansible-playbook -i ~/openshift_platform_automation/OpenShift_Prod/inventory/hosts -l drl09ocpcma01.na.bestbuy.com -v ~/openshift_platform_automation/OpenShift_Prod/roles/role_add_newgroup/pb_add_groups.yaml --ask-vault-pass -e us_dr=true -k
```

Additional Information
======================

For More information please refer : https://confluence.ca.bestbuy.com/display/OCPT/AD+Sync
