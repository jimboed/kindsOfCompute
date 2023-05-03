# SEC045 Endpoint Security - Workstation Compliance Cheatsheet

----------

**Version:**  2.1

**Last Updated:**  February 9, 2021

-----------

This Cheatsheet supports the [SEC045 Endpoint Security - Workstation Compliance](https://github.ibm.com/cloud-docs-internal/service-framework/blob/2020Q1/SOURCE_REQS/SEC/sec045.md) requirement and serves as the evidence for requirement completion.  

## Endpoint Security - Workstation Compliance Checklist

Managers can access their team's workstation compliance reports using the Beekeeper tool at: https://beekeeper.us1a.cirrus.ibm.com/

- [x] Click on `Users`, which will bring up a new page with list of reports.

![sec045pic1](https://github.ibm.com/cloud-docs-internal/service-framework/blob/main/static_content/images/sec045pic1.png)

- [x] Check `Compliant` status for their employees as appropriate, when the reported status is different than Compliant (in-Non-complaint column).

- [x] Click on `Device` tab and right to that click on `Create Report`, name the report with reference to SEC045 Compliance, and click `Build this thing!`

![sec045pic2](https://github.ibm.com/cloud-docs-internal/service-framework/blob/main/static_content/images/sec045pic2.png)

- [x] View your report in `Reports` tab with your file name (_it will take some time to generate your report in tool_).

![sec045pic3](https://github.ibm.com/cloud-docs-internal/service-framework/blob/main/static_content/images/sec045pic3.png)

## Privileged User Reports

- Users must register in Beekeeper to classify them as Privileged Users
- If you are required to register as a Privileged User as part of your job, follow the steps below to complete the Privileged User registration - https://w3.ibm.com/w3publisher/cio-endpoint-security/beekeeper/beekeeper-privileged-user

   - **Note**: 
      - Once you click on `Device` tab, you will be able to see the device details of both Privileged and Non-Privileged Users Report
      - If you want the report of only Privileged Users, click on `Classification` field, select `Yes`, click on `Search` (you will see only the privileged user details), and click on `Create Report` to download the report.

- [x] Managers should work with their team members to address the following:
   - [x] Resolve all the non-compliant device Status
   - [x] Register all devices, including laptops, virtual machines, and mobile devices
   - [x] Ensure team members are aware of endpoint security and properly register devices and confidential data (data can be obtained from Beekeeper tool)
   - **Note**: You can check on `Compliance Checks` column to know which checks have failed for non-compliant devices to fix the issue.

- [x] Retain evidence of all actions taken against workstations (e.g., eAMT Disposal Request, eAMT Email, Employee Statement, screen capture of Beekeeper, etc.) for audit purposes
- [x] Ensure team members understand that every IBMer is personally responsible for actions that may violate IBM Business Conduct Guidelines (BCG). In particular, all installed and used software needs to be authorized and appropriately licensed. To be compliant and only install approved software, it’s useful to start from IBM Guidelines and check for any additional approved open source package:

- https://zenhub.ibm.com/app/workspaces/ibm-automation-saas-6019733de38f226b805b1232/issues/automation-saas/security-and-network/34
