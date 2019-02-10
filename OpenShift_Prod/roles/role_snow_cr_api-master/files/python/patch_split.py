import json

docs = json.load(open('roles/role_snow_cr_api/files/json/{{operation}}.json'))

for ii, change in enumerate(docs):
    with open('roles/role_snow_cr_api/files/json/{{operation}}_change{}.json'.format(ii), 'w') as out:
        json.dump(change, out, indent=2)
