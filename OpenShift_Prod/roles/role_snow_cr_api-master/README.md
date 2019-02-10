Purpose
=======
This role has been written to create CR using ServiceNow API.

Role Name
=========
role_snow_cr_api

Requirements
------------

1. Provide input for Patch Change Request Submit.

```
$ roles/role_snow_cr_api/vars/patch.yml
```

2. Provide input for Decommission Change Request Submit. 

```
$ vi roles/role_snow_cr_api/vars/decom.yml
```
3. Provide input for General Change Request Submit

```
$ vi roles/role_snow_cr_api/vars/general.yml
```
4. serviceinst - Service instant name "bestbuy.service-now.com"
5. email - Email id to get change report.
6. login_user - Service now API login id (not GUI Login's). 
7. login_pass - Service now API password (not GUI Login's).

To get access to API, Reach out Change management team.

Note:

1. Use double backslash (\\) instead Single backslash (\)
2. Sample variables file for patch.yml,decom.yml,general.yml located at roles/role_snow_cr_api/vars/samples
3. For Decom Phase 1 CR we need provide IRM details in vars/decom.yml
   a) irm_approved_by: "Vasu"
   b) approval_status: "Approved"
   c) date: "2018-04-26 00:00:01"
   d) irm_comments: "Aproved to Decom Servers"

Additional Information
======================

1. For more information refer: https://sites.bestbuy.com/corp/ITSM/Change/_layouts/15/WopiFrame.aspx?sourcedoc=/corp/ITSM/Change/Shared%20Documents/Change%20API%20-%20Client%20Specifications.docx&action=default
2. Either Firewall rules implement to connect Service now or Proxy can be used.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

split.py - Will split patch.json/decom.json/general.json file into multiple patch_change[0...]/decom_change[0...]/general_change[0...] files

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```
$ vi pb_snow_cr_api.yml

---
- hosts: localhost
  gather_facts: no
  vars_prompt:
    - name: login_user
      prompt: "enter the Service Now API Login User"
    - name: login_pass
      prompt: "enter the Service Now API Pass"
  roles:
    - { role: role_snow_cr_api }

```

How to Execute
--------------

1. Patch Change Request

```
$ ansible-playbook pb_snow_cr_api.yml -e operation=patch -vv
```

2. Decom Change Request

```
$ ansible-playbook pb_snow_cr_api.yml -e operation=decom -vv
```

3. General/Normal Change Request

```
$ ansible-playbook pb_snow_cr_api.yml -e operation=general -vv
```


Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
