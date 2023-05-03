

# Whitesource Helper

*************************************************************************************
## 00 Overview
https://github.ibm.com/APaaS/whitesource_trigger_helper


There exists a "whitesource_trigger" branch in a repo, who's only job is to trigger whitesource to run on the branch. 
This branch should really never be used or edited, except for that. 



What the scripts actually do, is make a pull request AND merge recent changes from the main branch into 
the "whitesource_trigger" branch, so that the scan is running on the most recent code. 

Once changes are merged, the scripts then append one newLine character to the end of the of the ".whitesource" config file 
on the whitesource_trigger branch to trigger the scan to start. 


these steps are broken into the following scripts, which CAN be run separately if need be: 
```
python3 01_merge_from_master_to_trigger_branch.py <optionally_provide_repo_list>

python3 03_trigger_whitesource.py <optionally_provide_repo_list>

```





guidance for running is broken down into the following : 

- 01 download the helper from git
- 02 set org and repos
- 03 set GH token
- 04 run scripts
- 05 potential problems


*************************************************************************************

## 01 download the helper from git

clone repo
```
git clone git@github.ibm.com:APaaS/whitesource_trigger_helper.git && cd whitesource_trigger_helper

```

*************************************************************************************

## 02 set org and repos

Within the directory that has been downloaded, there is a json file  called 
"_list_of_repos.json"

that should contain a list of the repos that need to be triggered. 

the format of the repo json file should be (for example):

```
[
    "org1/repo1",
    "org1/repo2",
    "org1/repo3",

    "org2/repo1",
    "org2/repo2"
]

```

for automation-saas, this list should match the list found at:
```
https://pages.github.ibm.com/APaaS/playbooks/PlaybookList/WhiteSource/repo%20scan%20list/scanList/
```

If you want to use a different json file, 
you can just pass the name of the preferred json file as an argument to the python call
*************************************************************************************
## 03 set GH token
 
set GHE api token as environment varaible: 
```
gh_token=< ghe_api_token >
```

*************************************************************************************

## 04 run scripts

now you just need to run the scripts. 

```
. 00_run.sh

```

 


*************************************************************************************

## 05 potential problems, I am intending to fix


- there should be a "whitesource_trigger" branch already in the repo. 
- if the "whitesource_trigger" branch has any file that is ahead of the master branch, when you run the 
    "merge from master to whitesource trigger" step, there will be a merge conflict. this conflict has to be resolved before 
    the whitesource trigger, or the trigger will not include any changes that should be pulled and merged from master. 
    There is not currently a way to do this with the GHE api, but I am working on a solution. 

- in order for there to be consistency between the whitesource_trigger branch and the main branch, the .whitecource config file should have an additional parameter (after default):
    - example: 
    ```
    {
        "settingsInheritedFrom": "whitesource-config/whitesource-config@master",
            "scanSettings": {
                "baseBranches": ["whitesource_trigger", "master"]
            }
    }
    ```
    - the relevant part is: 
        ```
            "scanSettings": {
                "baseBranches": ["whitesource_trigger", "master"]
            }
        ```
*************************************************************************************
