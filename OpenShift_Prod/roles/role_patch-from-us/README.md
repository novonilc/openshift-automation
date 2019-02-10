**Purpose**

Install/Update rpm's on RHEL 5 and above 

**Requirements**

Below roles should be clone before playbook execution

1. Roles:
  1. Remove old logs and kernel before patch
     * role_patching_cleanup
     **Link:** https://pdl01puput01c.na.xxxxxx.com/ansible/role_patching_cleanup
  2. Take Server Configuration backup ex: fstab,lvm and other files
     * role_server_config_backup
     **Link:** https://pdl01puput01c.na.xxxxxx.com/ansible/role_server_config_backup
  3. RHEL Cluster registration
     * role_ha_registration
     **Link:** https://pdl01puput01c.na.xxxxxx.com/ansible/role_ha_registration
  4. Install/Update packages/rmp's
     * role_patch
     **Link:** https://pdl01puput01c.na.xxxxxx.com/ansible/role_patch 
  5. Restart the server's post patch
     * role_rolling_restart
     **Link:** https://pdl01puput01c.na.xxxxxx.com/ansible/role_rolling_restart

2. Provide inputs for playbook variables
  1. roles_enable_all: true
  2. custom_enable: true
  3. cutom_rpms: ["*"] for multiples cutom_rpms: ["rpm1","rpm2"]
  4. exclude: ["rubrik-agent*"] for multiples excludes: ["rpm1","rpm2"]

**Inventory File**

```
[PatchServers]
server1
server2
```

**How to execute ?**

```
$ ansible-playbook -i <inv> pb_patch.yml -e '{"roles_enable_all": true,"custom_enable":true,"custom_rpms":["*"]}' -vv

```

**Exclude Packages**

```

$ ansible-playbook -i patch.ini pb_patch.yml -e '{"roles_enable_all": true,"custom_enable":true,"custom_rpms":["*"],"exclude":["rubrik-agent*"]}' -vv

```
