# Boarding Github to AccessHub

*************************************************************************************
## Overview
Steps board github teams, organizations, or repos into AccessHub, to use AccessHub with Github for Access control by groups
From guide at: 
https://w3.ibm.com/w3publisher/accesshub-community/boarding/self-boarding/github

 


- 01 Must Gathers
- 02 Complete Accesshub boarding application
- 03 Walkthrough Video

*************************************************************************************

## 01 Must gathers
- API token is needed for GitHub self-boarding

- ONE of the following:
    - IMAP number registration  
        - http://ibm.biz/EAL-Registration

    ^---- OR ----v
    
    - PID
        - http://ibm.biz/Create-PID

        - link to register app in clearing house once you have a pid:

            - http://ibm.biz/Clearing-House-Registration


 - names, emails and serial numbers (??) of approvers
*************************************************************************************

## 02 Complete Accesshub boarding application

Link to application boarding: 

1. https://ah-cbt-prod.dal1a.cirrus.ibm.com/#/

2. click link for "Board New Application"

    1. Page 1 
        - General Questions
            - Application Name
            - Application Description
            - Technical Owner
                - valid IBM email address
            - ID type selection:
                - IMAP or PID
                    - If you are getting a new IMAP number
                        - Fill out required info, everything with a red hilight
                        - Once Your APP is atleast to  "Development", the app will be avialable as a group you can request access to in
                            - https://ibm-test.idaccesshub.com/ECMv6/request/requestHome 
                            - you will be asked for a password, and your W3 id, but your W3 prod password and your W3 TEST password are different. 

            - value for selected ID type (IMAP or PID)
        - Approver workflow details
            - add approver details for 2nd level, 3rd level , ect
            - requires name, email and serial number (??) of approvers


        - Connection details
            - type of connection SHOULD be "Github"
            - if application's type is not the list, it does not have "Automated provisioning". follow boarding process at:
                - http://ibm.biz/accesshubboarding 

    2. Page 2
        - Github info entry
            - github API token
                - token must have appropriate priveleges for application type that will be selected.
            - github application type(select one of the followng:)
                - organization
                - team
                - repo
            - Access type
                - When a new member is added, you have the option to enable requesting an access type based on the application type (selected above)
                - create groups, and enable an access type for the group
                    - organization
                        - Member or Owner
                    - team
                        - Maintainer or Member
                    - repo
                        - Read, Write, or Admin
3. Submit Application.
    Once the form is submitted, the application is instantly boarded and available in the AccessHub UAT  environment, where it is available for testing.

*************************************************************************************









## 03 Walkthrough Video

[link](../../assets/videos/Self_Boarding_GHE_CBT.mp4)

Video embed: 
<video style="width:100%" controls>
  <source src="../../assets/videos/Self_Boarding_GHE_CBT.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

 