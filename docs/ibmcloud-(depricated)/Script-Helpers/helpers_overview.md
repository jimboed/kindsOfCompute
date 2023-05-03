

# Helpers Overview

*************************************************************************************
## 00 Overview
these are a collection of helpers that have been written and shared with the team. 



in alphabetical order: 

- csutil
- whitesource
 


*************************************************************************************

## csutil

csutil is a tool that needs to be run on clusters in order for them to be included as part of SOS inventory. 

csutil was originally meant for use with kubernetes clusters, and was later updated to include openshift clusters. 


running csutil on the k8s clusters is relatively strait foreward, 
but rinning it on openshift clusters is somewhat tedious and complicated. 


in addition 1, we need to keep track of which tls certs are used on which cluster, so that we dont use the same cert on more than one cluster. 
in addition 2, we should only run csutil on clusters tagged "cloudrock" in ibmcloud. 


accomplish this, given the constraints, a set of helper scripts have been created and shared with the team. 

csutil helpers will : 

- 01 get a list of clusters in ibmcloud tagged cloudrock
- 02 get a list of clusters in SOS inventory
- 03 for k8s clusters, download contexts to kubectl
- 04 for open shift clusters:
    - download context to kubectl (auth info will be empty)
    - get url for cluster
    - use url to log in to cluster with api key
        - this will add auth info for the url into the kubeconfig
    - edit the kubeconfig
        - back up the kubeconfig
        - get the auth info for the url of the cluster
        - add that same url auth info as the cluster name auth info

        - write info to kubeconfig


- 05 generate a bash script with ibmcloud account log in, and csutil command for each cluster 
- 06 double check the generated bash script  
- 07 run the bash script
    - take note of any errors. 


*************************************************************************************

## whitesource

whitesource will scan a repo an create a list of issues, each issue addressing a vulnerability discovverd by whitesource. 

whitesource will only be triggered to scan if one or more of the folling happens: 

- 01 a new file is added
- 02 a file is deleted
- 03 a congiruation file is edited 
- 04 the .whitesource config file is edited. 


these helper scripts will help in: 
*  given a list of repos, 
    *  make a pull request from the main branch to a "whitesource_trigger" branch
    *  if there are NO MERE CONFLICTS, merge from main to whitesource_trigger
    *  add one new line character the .whitesource config file in the whitesource_trigger branch


*************************************************************************************
 