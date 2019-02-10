#!/usr/bin/python

import subprocess
import os




def main():
    apply_quota_projects = open(os.path.join(os.getcwd(), "apply-quota-projects.txt"), "r")

    while True:

        project_line = apply_quota_projects.readline()
        project_line = project_line.rstrip()
        if not project_line :
            break

        if project_line.startswith("#"):
            continue

        try:
            print("== Applying compute-resource quota for project ==")
            project_quota = subprocess.check_output('oc create -f ./resource_quota_project.yaml -n '+project_line, shell=True)
            status = project_quota.decode("utf-8")
            print ("Project:" + project_line +" | Quota Status : "+ status)

            print ("== Applying limit range quota for project ==")
            limit_range = subprocess.check_output('oc create -f ./resource_quota_pods_container.yaml -n ' + project_line,
                                                    shell=True)
            limit_range_status=limit_range.decode("utf-8")
            print("Project:" + project_line + " | Limit Range Status : " + limit_range_status)

        except:
            print ("Error creating quota for project "+ project_line)


if __name__ == "__main__":
    main()
