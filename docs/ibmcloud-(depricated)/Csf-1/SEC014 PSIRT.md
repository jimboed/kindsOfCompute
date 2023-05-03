# Automation SaaS Platform Access Model and Management
The spec describes the access model for different roles in the Automation SaaS platform. AccessHub is used to manage the accesses in Automation SaaS platform. AccessHub should be the only way to alter access policies in Automation SaaS platform. User should not be given administration role to manage the IAM access directly in AWS Cloud.
- AccessHub can integrate with AWS Cloud IAM, github, blue group, CBN and etc.

Service access for applications will be controled by the services IAM polices.  
- For details please refer to [Tenant Management and Security Architecture](https://github.ibm.com/automation-saas/native-AWS/tree/main/architecture/FeatureSpecs/TenantMgt-Security-Arch)  

## Access model with AWS Cloud IAM
AccessHub can integrate with AWS Cloud IAM to manages accesses of IAM enabled services, including ROSA, SysDig, LogDNA, ActivityTracker and etc.

### Terminology
- Account: The resource, resource group, access group and access policy is scoped in one AWS Cloud account.
- Resource: AWS Cloud provided services or components, in this chapter, the resource is specific to services with IAM enabled.
- Resource group: You can use a resource group to organize your account resources in customizable groupings so that you can quickly assign users access to more than one resource at a time. Any account resource that is managed by using IAM access control belongs to a resource group within your account. Users are not added to resource groups, but users are provided access to the resources within or can manage the resource group. The resource on IBM Cloud must belong to a resource group.
- Access group: You can create an access group to organize a set of users and service IDs into a single entity and easily assign permissions. You can assign a single policy to the group instead of assigning the same access multiple times per individual user or service ID. User can be added into an access group then can have all roles defined in the access policies within the group.  
- Access policy: Define access roles for specific service or resource group then be added into an access group.
- Platform access: The access is related to actions including creating, deleting, viewing service instance, but not any actions inside the service instance.
- Service access: The access is related to actions including visiting service instance dashboard, updating service instance configuration and etc.


# Access roles, Account information, and Access groups 

## Access role information
- Platform SRE - Provide SRE capabilities for Platform components deployed in production, staging and development. They are on-call for outages and issues in any of these environments but also provide engineering to make these environments more resilient. As part of this Platform SREs will own the monitoring/logging, incident response and engineering to reduce toil and improve efficiency, reliability, and resiliency.
- Service SRE - Onboard new services and work continuously to make automation changes to improve reliability and resiliency for services. Service Team SREs will own the deployment of services, monitoring/logging (including key metrics and alerting), incident response, and engineering to reduce toil and improve efficiency, reliability, and resiliency.
    - Note This includes automation platform developers 
- Service ID - Intended to represent a non-human user that needs to authenticate and be authorized to run/manage AWS elements required for the automation platform or the application services.

## Account information - Xacct
### Build 
- Usage
    - Development effort, Development container registry
- Job role access
    - Platform SRE
       - Allowed full access to all resource groups 		
     - Service SRE
       - Allowed full access based on service resource group 		
     - Service ID
       - Allowed full access based on resource group
		
### Test-Stage - Staging account
- Usage
    - Multiple production-like environments
    - System testing 
    - Penetration testing
    - Performance testing (can bring the system down)	
- Job role access
    - Platform SRE
       - Allowed full access to all resource groups
     - Service SRE
       - Allowed SRE console access based on service resource group
       - Temporary firecall/break-glass access given on exception basis per resource group
     - Service ID
       - Allowed full access based on resource group


### Canary Production - Production account
- Usage
    - Exact replica of production (scaled down)
    - Staging container registry
    - Practice full production setup and upgrade
- Job role access
    - Platform SRE
       - Allowed full access to all resource groups
     - Service SRE
       - Temporary firecall/break-glass access given on exception basis per resource group
     - Service ID
       - Allowed full access based on resource group
       
### Production - Production account
- Usage
    - Customer service systems
    - Production container registry
- Job role access
    - Platform SRE
       - Allowed full access to all resource groups
     - Service SRE
       - Temporary firecall/break-glass access given on exception basis per resource group
     - Service ID
       - Allowed full access based on resource group

## Resource group information - Xresgrp (Note: these need to be validated See [GHE Issue](https://zenhub.ibm.com/app/workspaces/aws-6019733de38f226b805b1232/issues/automation-saas/security-and-network/348))

- AutoPlatform - This resource group is for the automation platform team, this will include Cloudrock, IAF, and Bedrock all of their resources would be deployed into this resource group
- CICD - This resource group is for the CI/CD team, all the resources of CI/CD would be deployed into this resource group


## Access group permissions and naming standard 

- Automation_Platform_Xacct_Global_PlatformSRE_Xresgrp
    - Job role 
      - Platform SRE
    - AWS IAM Permissions
      - TBD
    - Secrets access
      - None
- Automation_Platform_Xacct_Global_PlatformSRE_Xresgrp_Secrets_Admin
    - Job role 
      - Platform SRE
    - AWS IAM Permissions
      - TBD
    - Secrets access
      - Write
    - Note: 
      - The only resource groups that this will be created for is Bedrock,CICD,CloudRock and IAF
      - Used by resource group installers and debug SRE's on a temporary basis.
      - If used for production debug requires two people to view screen at the same time via screenshare
    
 - Automation_Platform_Xacct_Global_ServiceSRE_Xresgrp
     - Job role
       - Service SRE
    - AWS IAM Permissions
      - TBD
    - Secrets access
      - Read
      
 - Automation_Platform_Xacct_Global_ServiceSRE_Xresgrp_SRE_Console
     - Job role 
       - Service SRE
    - AWS IAM Permissions
      - SRE Console
    - Secrets access
      - None
      
- Automation_Platform_Xacct_Global_ServiceSRE_Xresgrp_Secrets_Admin
     - Job role 
       - Service SRE
    - AWS IAM Permissions
      - TBD
    - Secrets access
      - Write
    - Note: 
      - Used by resource group installers and debug SRE's on a temporary basis.
      - If used for production debug requires two people to view screen at the same time via screenshare
      
- Automation_Platform_Xacct_Global_ServiceID_Xresgrp
     - Job role 
       - Service ID
    - AWS IAM Permissions
      - TBD
    - Secrets access
      - Read
   

## Use Cases 

- The service-a team is developing a new service on the automation Platform. They will need access to deploy their applications in the Build account, in this case the **service-a developer** will request access to: 
	- Build: Automation_Platform_Build_Global_ServiceSRE_service-a

- The service-a team is developing a new service on the automation Platform. They will need access to the SRE console in staging, in this case the **service-a developer** will request access to: 
	- Build: Automation_Platform_Test-Stage_Global_ServiceSRE_service-a_SRE_Console
	
- The service-a team is developing a new service on the automation Platform. They will need access to the write secrets in staging, in this case the **service-a developer** will request access to: 
	- Build: Automation_Platform_Build_Global_ServiceSRE_service-a_Secrets_Admin


### Access Workflow

1. Person's First line manager
2. Service/Project Owner  (This is not needed if request is for Automation Platform resource groups)
3. Automation Platform owner
	- MCASTLE@uk.ibm.com 
	- GRAYMF@uk.ibm.com

 
