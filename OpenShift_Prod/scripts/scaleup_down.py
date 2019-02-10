#!/usr/bin/python

import subprocess
pod_list = {}

projects_str = subprocess.check_output(["oc", "get","--no-headers", "projects"])
projects = projects_str.split("\n")

#excludes = ["default","openshift","openshift-infra","logging","kube-public","kube-system","sysdig-cloud"]
excludes = ["default","openshift","kube-public","kube-system","sysdig-cloud"]

for project in projects:
    pod_list_ = {}
    if len(project.split())>0:
        namespace = project.split()[0]
    else:
        namespace = project
    if namespace not in excludes:
        subprocess.call(["oc", "project",namespace])
        try:
            dc_str = subprocess.check_output(["oc", "get","--no-headers","dc"])
            dcs = dc_str.split("\n")
            for dc in dcs:
                dc_parts = dc.split()
                name = dc_parts[0]
                current = int(dc_parts[2])
                if current>0:
                    pod_list_[name] = current
        except:
            pass
        pod_list [namespace] = pod_list_

f = open('scale_down.txt','w')

for namespace in pod_list:
    for pod in pod_list[namespace]:
        #print namespace, pod, pod_list[namespace][pod]
        #print "oc scale dc {dc} -n {project} --replicas=0".format(dc=pod,project=namespace)
        f.write("oc scale dc {dc} -n {project} --replicas=0\n".format(dc=pod,project=namespace))

f.close()

#print "########################################\n########################################"

f = open('scale_up.txt','w')

for namespace in pod_list:
    for pod in pod_list[namespace]:
        #print namespace, pod, pod_list[namespace][pod]
        #print "oc scale dc {dc} -n {project} --replicas={reps}\nsleep 5\n".format(dc=pod,project=namespace,reps=pod_list[namespace][pod])
        f.write("oc scale dc {dc} -n {project} --replicas={reps}\nsleep 5\n".format(dc=pod,project=namespace,reps=pod_list[namespace][pod]))

f.close()
