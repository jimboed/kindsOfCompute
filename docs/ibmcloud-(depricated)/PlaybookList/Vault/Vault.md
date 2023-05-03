# Vault Addtional Information 
*************************************************************************************
## 00 Guide to using Vault

SOS Vault uses a unique path for each service name to store secret related information.  A service name is unique per offering.
Our service name is called automation-platform

Our path is generic/crn/v1/bluemix/public/automation-platform/global

For the squads that are creating code and need to store secretes we create approles for their area.

Ex 
approle metering
Path generic/crn/v1/bluemix/public/automation-platform/global/-/metering/*
approle testpak
Path generic/crn/v1/bluemix/public/automation-platform/global/-/testpak/*

We are defining  a user defined for each approle. This is currently the squad leader.

The user will log into vault using their github credentials

The user will get a wrapped token to use to create secrets for their area. (These need to be stored securely)

The secrets they create can be utilized by their applications

*************************************************************************************

## 01 Inital SOS Information 


Start here: https://pages.github.ibm.com/vault-as-a-service/vault/usage/getting-started-production-service.html

Setting up access:

Step 3
The wrapped token will come from the SOS request

Make sure you store the unwrapped approle information in an approved password storage tool
see: https://w3.ibm.com/help/#/article/38033

output is role_id cad88e74-Jim-sample-role-id-3be51bc4ddca

Step 4
1)vault write auth/approle/role/crn_v1_bluemix_public_automation-platform_global_default/secret-id 'metadata={"person":"hutchisn@us.ibm.com"}'

output is token       9f68dd04-Jim-sample-token-b6ad64d7c9b4

## 02 Authenticating with your role ID and secret ID


1) vault write auth/approle/login role_id=cad88e74-Jim-sample-role-id-3be51bc4ddca secret_id=9f68dd04-Jim-sample-token-b6ad64d7c9b4

output is token 9f68dd04-Jim-sample-write-token-b6ad64d7c9b4

2) vault write generic/user/hutchisn/.vault-token key=9f68dd04-Jim-sample-write-token-b6ad64d7c9b4

## 03 Define approle for sub areas

https://pages.github.ibm.com/vault-as-a-service/vault/usage/crn.html
https://pages.github.ibm.com/vault-as-a-service/vault/onboarding/add-modify-approle.html

Sample

Geography : us-south 
  Service CRN root elements or project name : bluemix/public/automation-platform/global
  AppRole name : metering
  Bound CIDR list (optional) :
  Access policy :

      path "generic/crn/v1/bluemix/public/automation-platform/global/-/metering/*" {
          capabilities = ["create", "read", "update", "delete", "list"]
      }

  EU Cloud (see instructions) : No

Geography : us-south 
  Service CRN root elements or project name : bluemix/public/automation-platform/global
  AppRole name : testpak
  Bound CIDR list (optional) :
  Access policy :

      path "generic/crn/v1/bluemix/public/automation-platform/global/-/testpak/*" {
          capabilities = ["create", "read", "update", "delete", "list"]
      }

  EU Cloud (see instructions) : No



## 04 Define approle for sub areas

https://pages.github.ibm.com/vault-as-a-service/vault/onboarding/add-user.html


Geography : us-south

  user-github-id-1 : Michael-Maffei 

      path "/generic/crn/v1/bluemix/public/your-service-name/your-location/-/testpak/*" {
          capabilities = ["create","update"]
      }

  EU Cloud (see instructions) : No

