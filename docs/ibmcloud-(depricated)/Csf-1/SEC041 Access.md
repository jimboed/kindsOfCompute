<!-- start -->
# SEC041 Access Management and AccessHub Cheatsheet
----------

**Version:**  1.1

**Last Updated:**  June 24, 2021

-----------

**Change History:**
- September 2020 - initial version of the cheatsheet
- June 2021 - updates for FedRAMP related implementation for groups membership and infrastructure access

---

This Cheatsheet supports [SEC041 Access Management and AccessHub](https://test.cloud.ibm.com/docs/service-framework?topic=service-framework-security-sec-#sec041-access-management-and-accesshub) requirements and serves as the evidence for requirement completion.

AccessHub is the main tool to be used for tracking accesses, approvals and revalidation (i.e. employees revalidation and continuous business need). However, there are two patterns that can be implemented when adopting the tool:

1. **AccessHub built-in support for GitHub, IAM, Bluegroups and SoftLayer classic applications**. The typical setup requires operators to apply for access in AccessHub for each group in each system they wish to be a member. Bulk-boarding templates are now available for onboarding those applications into AccessHub by providing details in a spreadsheet.
Use this pattern if your access control use cases are not complex and do not require managing many different types of accesses  (e.g. if you only need to manage IAM based access).

2. **Role Based Access Control (RBAC)**. In this case, AccessHub is used to control membership to a single GitHub application based on GHE teams, which represent roles. An external provisioning tool is used to synchronize GitHub Team membership with other endpoints/systems. Use this pattern if your access control use cases are more complex and require managing multiple types of access for your operators. In that case, a RBAC approach might simplify the overall management.
The typical setup has a GitHub Team based on <service-role-residence>. For example, if the GHE Team iks-conductor-us represents all the US based conductors (SRE), then membership to that GHE Team will translate into granting access to a number of systems including IAM access groups for specific regions, Bluegroups to read DevOps jobs, Launch Darkly, etc. See the links below to get more details about the existing implementations.

    - Python
        - code repo: [user-management tool](https://github.ibm.com/cloudant/user-management)
    - Go-lang
        - code repo: [access-sync tool](https://github.ibm.com/mhub/usam-sync)
        - slack channel: [#access-sync](https://ibm-cloudplatform.slack.com/archives/C016P71CYG3)


IBM Cloud service teams willing to follow pattern #2 above (RBAC) should consider the following:
- IBM Cloud service teams are encouraged to adopt the go-based implementation of the user synchronization tool provided by the Event Streams team. The python-based implementation of the synchronization tool provided by the Cloudant team, is permitted only to the Cloudant and ICD teams. No additional home-grown implementations will be allowed, and any deviation must be managed as an exception during the SEC027 Cloud Security Review.
- Any extension to the existing tools (e.g. to cover additional endpoints) will be in charge of the adopting IBM Cloud service teams. They can contribute the extensions back to the origin through a Pull Request, and it will be up to the owners of the original code to decide to accept the contribution or not. In case the code being contributed is not accepted to be merged in the master streams, the contributing teams will have to fork the original repository and maintain the fork on their own.
- The owning teams are not responsible for supporting the code outside of their teams, however they can provide guidance and recommendations to the adopters.
- The adoption of these tools is supposed to happen in a community-based approach.


## Checklist:

- [x] IBM Cloud accounts are owned by functional ID. Service Team uses separate accounts for production and non-production workloads.  
- [x] AccessHub is used to approve, revalidate and audit access and IAM Group membership for IBM Cloud accounts for production and non-production environments
- [x] AccessHub is used to approve, revalidate and audit access to any infrastructure account (i.e. SoftLayer classic infrastructure access, NGDC access, etc.) for production and non-production environments 
- [No, due to GHE issues we are using manual revalidation ] AccessHub is used to approve, revalidate and audit membership to GHE Organizations and Teams please see top 5 results. https://github.ibm.com/ibmcloud/ciso-signoff/issues/498
- x ] AccessHub is used to control admin/write access for all GHE repositories containing source code via GHE teams membership.
    - Any access to such repositories granted outside of a GHE team membership will be detected and managed as an exception to be remediated
- [x] AccessHub is used to approve, revalidate and audit privileges assigned to any DevOps job that makes production changes (i.e. via membership to IBM Cloud Access Groups, IBM Bluegroups for IBM Public Cloud, IBM Cloud FedRAMP IDP groups for the Federal environment)
   - [ ] Exceptions to the above must be properly documented and approved via the Public Cloud Exceptions (PCE) process or via the FedRAMP Deviation Request process
- [x] Teams must enable 2 level approval workflow for all their entitlements in AccessHub applications. See the possible [approval workflows](https://w3.ibm.com/w3publisher/accesshub-community/standard-configurations/workflow-configuration) configurations for more details. The recommended workflow is one of the STANDARD_2LVL or STANDARD_2LVL_ENT_OWN.
- [N/A ] If RBAC pattern is implemented, teams must provide evidence that the access-sync tool is being used
    - [ ] If the user management tool is used instead of the access-sync, teams must obtain a valid exception (this does not apply to ICD and Cloudant only)
    - Depending on the selected implementation, specific evidence and reports must be generated to demonstrate the proper controls are in place and reconciliation works effectively. Requested evidence is:
        - [ ] configuration of the tool that shows which endpoints are managed outside of AccessHub, the definition of the Roles and the mapping to AccessHub entitlements in a GHE application
        - [ ] execution logs to demonstrate the tool runs peridically and at least once per day, showing evidence of account management actions performed by the tool (account creation, modification, enabling, disabling, and removal actions)
        - [ ] reports showing results of the reconciliation performed by the tool. One way to implement this can be using the auditree framework, implementing fetchers for each of the endpoints covered by the tool.
        - [ ] notifications in place to alert when the tool does not work for any reason (connectivity issues with the target endpoints, failures in provisioning/deprovisioning accesses, etc.)
- [x] Privileged groups follow least privilege principals AND geographic considerations. Groups identify the location for which they apply.  "Global" is a valid location, but should only be used when necessary.  Locations are based on https://pages.github.ibm.com/CloudEngineering/system_architecture/regions_zones.html. Examples for IAM Access Groups can be found in the Appendix below.
- [x] Teams must be able to generate a report of operators, functionalIDs and serviceAccounts with access to resources within a given geography.
- [x] Teams must be able to demonstrate that they restrict access to geographies in accordance with regulatory requirements.  Currently this includes EU Cloud restrictions on non-EU operators, FS Cloud restrictions on operators for `us-south, us-east`, and FedRAMP will also restrict location for certain roles. A control process must be in place to validate that operators have not been given access to regions/geographies they are not supposed to access.
- [N/A ] Teams must maintain an inventory of the shared ids they use, if any, and keep that up to date. Any shared id must be managed through a check-out/check-in mechanism, with password rotation at every use, prefrrably implemented using the IBM Secret Server/Thycotic solution offered by SOS. Additional guidelines and details are available in the [Access Control](https://pages.github.ibm.com/ibmcloud/Security/guidance/Access-Control.html#types-of-ids) section of the security gitbook.
- [x] The description field of any AccessHub application must clearly indicate the implemented authorization scheme of the two indicated above: role-based permissions vs. system-based permissions. Teams must provide copy of the `My Application Entitlement Details with Owner` AccessHub report for all their applications.
- [x] Justification and/or approval for access to a system must include considerations for [defined roles](https://github.ibm.com/ibmcloud/Security/blob/37d3ff5634f857d7aad4c86c23cf0b9a9e4cc25d/guidance/roles.md)

- [x] SEC041 SME signoff confirmation

[excel link](images/My_Application_Entitlement_Details_with_Owner_30Aug2021_1.xlsx)

- Reviewed and signed off in Top 5 https://github.ibm.com/ibmcloud/ciso-signoff/issues/498
