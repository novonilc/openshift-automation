#!/usr/bin/python

import subprocess
import os



def main():

    project_names=subprocess.check_output('oc get projects | awk \'{ if ($1!="NAME") print $1}\'', shell=True)
    project_names=project_names.decode("utf-8").split('\n')

    i=0
    while i < len(project_names):

        try:

            if not project_names[i]:
                continue

            compute_resource_quota=subprocess.check_output('oc describe quota compute-resources -n '+ project_names[i] + '| grep pods | awk \'{print $3}\'', shell=True)
            compute_resource_quota=compute_resource_quota.decode("utf-8")

            if (compute_resource_quota.startswith("20")):
                no_quota_projects_file = open(os.path.join(os.getcwd(), "quota-projects-pods.txt"), "a")
                no_quota_projects_file.write(project_names[i]+"\n")
                no_quota_projects_file.close
            elif not compute_resource_quota:
                no_quota_projects_file = open(os.path.join(os.getcwd(), "quota-empty-projects.txt"), "a")
                no_quota_projects_file.write(project_names[i]+"\n")
                no_quota_projects_file.close()

        except:
            print ("Error occured in executing script")
        i+=1


if __name__ == "__main__":
    main()
