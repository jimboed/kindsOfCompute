

# Get Images List




*************************************************************************************
## 00 Overview


When our auditree config is triggered to run from Travis, 
the twistlock code pulls the list of images to submit from the following url: 



```
https://github.ibm.com/automation-saas/security_cmdb/blob/main/twistlock/image_list_to_scan.json

```

This list is currently populated by the following procedure 
for each account with clusters that use images that need to be submitted to twistlock:

- 01 log in to ibmcloud
- 02 list clusters
- 03 with cluster name, add cluster config to kubectl
- 04 using newly added context, query cluster for image list
- 05 remove dublicates
- 06 update gihtub repo using normalized image list


*************************************************************************************

## 01 Log in to ibmcloud
```
    ibmcloud login --apikey < API_KEY >
```

*************************************************************************************

## 02 list clusters
```
    ibmcloud ks cluster  ls
```
  
*************************************************************************************

## 03 with cluster name, add cluster config to kubectl

```
ibmcloud ks cluster config --cluster < CLUSTER_NAME >
```

*************************************************************************************

## 04 using newly added context, query cluster for image list

Example: 
(In this case, I am adding outputs of the image list query to a file that can be parsed for duplicates in the next step)

```
kubectl get pods -A -o=custom-columns='IMAGE:.spec.containers[*].image' >> imageList.txt
```


*************************************************************************************

## 05 remove dublicates
Using the "imageList.txt" file from the last step, 

I can now use a python script to remove duplicates from the image list. 
This this example outputs a new file "imageList_normalized.txt". 

```python 
imageList =[]



with open("imageList_normalized.txt", 'w') as outfile, open("imageList.txt", 'r', encoding='utf-8') as infile:
    for line in infile:
        if line.strip() not in imageList: 
            imageList.append(line.strip())
            print(line)

    for index, image in enumerate(imageList[1:]):
        if index < len(imageList)-2:
            outfile.write('\t"'+image+'",\n')
        else: 
            outfile.write('\t"'+image+'"\n')
            
```
 
*************************************************************************************

## 06 update gihtub repo using normalized image list

Use the contentes of the "imageList_normalized.txt" file to edit the json file at the repo: 


```
https://github.ibm.com/automation-saas/security_cmdb/blob/main/twistlock/image_list_to_scan.json

```
*************************************************************************************
