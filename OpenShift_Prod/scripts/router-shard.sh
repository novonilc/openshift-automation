#!/bin/bash
# Usage: mkshard ID SELECTION-EXPRESSION
id=$1
sel="$2"
router=router-shard-$id           
oadm router $router --replicas=0  
dc=dc/router-shard-$id            
oc set env   $dc ROUTE_LABELS="$sel"  
oc scale $dc --replicas=3 
