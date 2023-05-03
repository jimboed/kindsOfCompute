

# SOS APIS

*************************************************************************************
## 00 Overview

- 01 API key
- 02 Urls
- 03 SOS API Docs


*************************************************************************************

## 01 API key


https://w3web.sos.ibm.com/app/apiKeyManagement
create an API KEY

set an ENV var: 
```
SOS_API_KEY=< the api key >
```




*************************************************************************************
## 02 Urls


if your permissions are set up in accessHub and the api key is set you can run the following to get cCodes this api key has access to:

```console
curl -X GET --header "Accept: application/json" --header "Content-Type: application/json" --header "apiKey:$SOS_API_KEY" "https://w3api.sos.ibm.com/api/v1/system/availableCCodes"

```
In this case, It returns 1 result, "ARMADA".

using the cCode, you can use it to get the applications this api key has access to:

```console

curl -X GET --header "Accept: application/json" --header "Content-Type: application/json" --header "apiKey:$SOS_API_KEY" "https://w3api.sos.ibm.com/api/v1/report/inventory/applications?cCode=ARMADA"

```
In this case, It returns 1 result, "automation-platform-as-a-service".



now I can use the cCode and application to get info about the inventory. 
the following will be useful: 

```console

curl -X GET --header "Accept: application/json" --header "Content-Type: application/json" --header "apiKey:$SOS_API_KEY" "https://w3api.sos.ibm.com/api/v1/report/common/complianceList?cCode=ARMADA&application=automation-platform-as-a-service&pageSize=500&pageNumber=1" > sos_complianceList.json

curl -X GET --header "Accept: application/json" --header "Content-Type: application/json" --header "apiKey:$SOS_API_KEY" "https://w3api.sos.ibm.com/api/v1/report/healthCheck/healthCheckDetails?cCode=ARMADA&application=automation-platform-as-a-service&pageSize=500&pageNumber=1"

```

here are a list of the getters I found in the docs: 
```
base URL: 
    https://w3api.sos.ibm.com


api/v1/system/availableCCodes

api/v1/report/inventory/applications


api/v1/report/bigfix/complianceList

api/v1/report/healthCheck/healthCheckDetails

api/v1/system/ut/mapping

api/v1/report/vulnerability/openVulnList
api/v1/report/vulnerability/plugins
api/v1/report/vulnerability/unScannedSystems
api/v1/report/vulnerability/vulnAlldata
api/v1/report/vulnerability/{pluginId}/systems
api/v1/report/vulnerability/{vulnId}

api/v1/report/qradar/sensors

api/v1/system/entitlement
api/v1/system/{utCode}/entitlement

api/v1/report/vulnerability/systemInfo
api/v1/report/vulnerability/systemInfo/{systemId}

api/v1/report/common/complianceList

api/v1/report/bigfix/generalHealthChecks
api/v1/report/bigfix/healthCheck/affectedSystems
api/v1/report/bigfix/healthCheck/{healthCheckId}
api/v1/report/bigfix/healthCheckAlldata
api/v1/report/bigfix/healthChecks
api/v1/report/bigfix/patch/affectedSystems
api/v1/report/bigfix/patch/{patchId}
api/v1/report/bigfix/patches
api/v1/report/bigfix/patchesAlldata
api/v1/report/bigfix/{systemId}/healthChecks
api/v1/report/bigfix/{systemId}/patches

```


*************************************************************************************
## 03 SOS API Docs

sos docs: 
https://pages.github.ibm.com/SOSTeam/SOS-Docs/api_platform_service/SOS-API-Service/

this is a 
poorly formatted page i found with the urls. 
https://github.ibm.com/SOSTeam/SOS-Docs/blob/main/docs/api_platform_service/ReportAPI.md






*************************************************************************************
