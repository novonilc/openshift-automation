import json

docs = json.load(open('roles/role_snow_cr_api/files/json/patch.json'))

for ii, change in enumerate(docs):
    with open('roles/role_snow_cr_api/files/json/patch_change{}.json'.format(ii), 'w') as out:
        json.dump(change, out, indent=2)
