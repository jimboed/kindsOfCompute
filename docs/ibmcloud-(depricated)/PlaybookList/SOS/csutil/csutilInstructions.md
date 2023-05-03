# Setup and install of csutil


### First, found after much frustration that Windows is not supported.  So, using an Ubuntu image, setup the IBM CLi
1. curl -sL https://ibm.biz/idt-installer | bash
2. Restart your shell or reboot after.  

3. Make sure your account has an API key.  
    * From https://cloud.ibm.com/ , 
        * click on Manage>Access(IAM)>API keys.  
        * (Suggest being under CloudRock DevOps’s account)

    * Click on Create an API key
    * Save that key because once the page closes you won’t be able to see it.
*************************************************************************************












### With the API key, you can login to IBM Cloud.  
    ibmcloud login --apikey < your api key >


```console

    API endpoint: https://cloud.ibm.com
    Region: us-south
    Authenticating...
    OK

    Targeted account CloudRock DevOps's Account (f001a6cc997241938cf9e2dbb88c3159) <-> 2148292
    Select a region (or press enter to skip):
    1. au-syd
    2. in-che
    3. jp-osa
    4. jp-tok
    5. kr-seo
    6. eu-de
    7. eu-gb
    8. ca-tor
    9. us-south
    10. us-south-test
    11. us-east
    12. br-sao
    Enter a number> 9
    Targeted region us-south


    API endpoint:      https://cloud.ibm.com
    Region:            us-south
    User:              arose@us.ibm.com
    Account:           CloudRock DevOps's Account (f001a6cc997241938cf9e2dbb88c3159) <-> 2148292
    Resource group:    No resource group targeted, use 'ibmcloud target -g RESOURCE_GROUP'
    CF API endpoint:
    Org:
    Space:
```
*************************************************************************************












### Now we can check what plugs we have loaded
    ibmcloud plugin list

```console

    Listing installed plug-ins

    Plugin Name                            Version   Status   Private endpoints supported
    cloud-object-storage                   1.2.3              false
    container-registry                     0.1.514            false
    container-service/kubernetes-service   1.0.233            false
    cloud-functions/wsk/functions/fn       1.0.54             false
```    
*************************************************************************************












### And check what repo’s are configured
    ibmcloud plugin repos

```console
    Listing added plug-in repositories

    Repo Name   URL                             Description
    IBM Cloud   https://plugins.cloud.ibm.com   Official repository(Formerly named 'Bluemix')
```
### Add the repo for csutil’s with command: 
    ibmcloud plugin repo-add stage https://plugins.test.cloud.ibm.com

```console
    OK
    https://plugins.test.cloud.ibm.com added as 'stage'.
```
*************************************************************************************












### Check out what versions of csutil’s are available 
    ibmcloud plugin repo-add stage https://plugins.test.cloud.ibm.com
    
    ibmcloud plugin repo-plugin -r stage csutil
    

```console
    OK
    https://plugins.test.cloud.ibm.com added as 'stage'.

    root@LAPTOP-HT2O7QE7:/oc# ibmcloud plugin  repo-plugin -r stage csutil
    Looking up 'csutil' from repository 'stage'...

    Name:           csutil
    Description:    Set up Kubernetes clusters for IBM service teams(internal only)
    Company:        IBM
    Homepage:       https://github.ibm.com/ibmcloud/ArmadaClusterSetupCLI
    Authors:        Robbie Minshall: rjminsha@us.ibm.com
                    John Celenza: jcelenza@us.ibm.com
                    Ralph Bateman: ralph@uk.ibm.com
    Versions:       Version    Compatible   SHA1                                       Minimal CLI version required
                    0.6.1      Yes          03b70a7e5908d57d98a7c6e274c7c62f2201e312   N/A
                    0.6.0      Yes          9975da5df67423221e83de12eec3590024ea184d   N/A
                    0.5.0      Yes          e709c228e2f29ae3ddc76e32834706b5515a4193   N/A
                    0.4.5      Yes          b83d7f932afdc6ea449136bba9a6986de964b3de   N/A
                    0.4.4      Yes          6f63e99e323fd9c8a55c0e55a196cdacdb422b8d   N/A
                    0.4.3      Yes          394467ccb54ae6dab9f7fbc92ecf16d50c28a123   N/A
                    0.4.2      Yes          28395029836ad5b43160c9c608f6a29c28e7b18c   N/A
                    0.4.1      Yes          d06e892e18d249678859b7bd77988a511b1dbaae   N/A
                    0.4.0      Yes          fcadaf55284a9760958868f508b2b034acab1561   N/A
                    0.0.208    Yes          d41b920d23361b6d365c10caa13c417c93253b88   N/A
                    0.0.198    Yes          eac246b9223c0a6523ab4119be42a1185f75dbfb   N/A
                    0.0.0426   Yes          01cce6b8993151bd0aa7a4e47fa6feeef4580e66   N/A
    Tags:
```
*************************************************************************************













### Install csutils  
    ibmcloud plugin install csutil -r stage

```console
    Looking up 'csutil' from repository 'stage'...
    Plug-in 'csutil 0.6.1' found in repository 'stage'
    Attempting to download the binary file...
    12.15 MiB / 12.15 MiB [====================================================================================] 100.00% 6s
    12740024 bytes downloaded
    Installing binary...
    OK
    Plug-in 'csutil 0.6.1' was successfully installed into /root/.bluemix/plugins/csutil. Use 'ibmcloud plugin show csutil' to show its details.
```
*************************************************************************************












### Check install
    ibmcloud plugin show csutil

```console

    Plugin Name                              csutil
    Plugin Version                           0.6.1
    Plugin SDK Version                       0.3.0
    Minimal IBM Cloud CLI version required   0.4.9
    Private endpoints supported              false

    Commands:
    csutil                    IBM Internal collection of utility commands for using IBM Cloud Kubernetes Service Clusters  
    csutil cluster-cleanup    I'll remove any setup that ibmcloud csutil cluster-setup did.  Please ensure ibmcloud ks region-set and cluster-setup have been run
    csutil cluster-setup      I'm here to help set up your Cluster.  Make sure you to have your SOS VPN configuration file ready.  You will also need to have run ibmcloud login and ibmcloud ks region-set.  If using the deprecated Prometheus support you will also need its values.yaml file and your Pager Duty Prometheus Service Integration Key. See https://github.ibm.com/ibmcloud/ArmadaClusterSetupCLI#usage-prereqs for full list of prereqs!
    csutil cluster-validate   Validate cluster
```
*************************************************************************************












*************************************************************************************
In theory, you should be able to setup your cluster now with csutil.  But, in my case I had to make sure I’d logged in with the api key, plus use an oc login.  I got oc from https://downloads-openshift-console.arose-security-576fccc9ae6a376a3c3284d61e75d6c2-0000.us-south.containers.appdomain.cloud/amd64/linux/oc.tar
Just un-tar, and put the oc command somewhere in your PATH, ie. /usr/local/bin
Then, I went into the OpenShift Web Console, clicked the drop down arrow in the upper right (IAM#arose@us.ibm.com), and chose ‘Copy Login Command’.  Then Display Token.  That will give me the oc login command to login with.  This token will expire, so refresh page as needed.
ie:   oc login --token=sha256~L5wwk3hyTiYJbvsuRZYaFau5TuI_OiJR4Npc1gEAq9k --server=https://c116-e.us-south.containers.cloud.ibm.com:30751
*************************************************************************************












### Let’s check what clusters we can work with
    kubectl config get-contexts

```console
    CURRENT   NAME   CLUSTER   AUTHINFO   NAMESPACE
    root@LAPTOP-HT2O7QE7:
```
*************************************************************************************












### So, we need to add clusters to what we can work with
    ibmcloud ks cluster ls

```console
    From 01 December 2020 virtual and bare metal servers that run Ubuntu 16 will be deprecated, in consideration of the upcoming April 2021 end-of-support date for Ubuntu 16. For more details, please see the announcement <https://ibm.biz/kube-flavors>

    The Kubernetes Ingress controller image is now supported for Ingress ALBs, and all new ALBs now run the Kubernetes Ingress image by default. Additionally, you must move any existing Ingress setups to the new Kubernetes Ingress before support for the legacy IBM Cloud Kubernetes Service Ingress image ends on June 1, 2021. More info: <https://ibm.biz/kube-ingress>

    OK
    Name                              ID                     State     Created        Workers   Location          Version                 Resource Group Name               Provider
    CloudRock-CICD                    c1hj38rd0ap7jkh2lcd0   normal    2 weeks ago    3         Dallas            4.6.22_1538_openshift   CloudRock                         classic
    CloudRock-Jack-SRE-Console-Stag   c1c9el5w01mveh6ncuf0   normal    3 weeks ago    6         Washington D.C.   1.19.9_1540             CloudRock                         vpc-gen2
    CloudRock-Tiger-SRE-Console       c13ggubd03jg9i2625t0   normal    1 month ago    9         Dallas            1.20.5_1533             CloudRock                         vpc-gen2
    arose-security-controls           c1o6a74d02rdum9lv0f0   normal    6 days ago     9         Dallas            4.6.22_1538_openshift   Katamari                          vpc-gen2
    cloudrock-cicd-cluster            c0eogc0d0i4bkg17e5gg   normal    2 months ago   1         Dallas            1.18.17_1546            CloudRock                         classic
    clusterkceat3cy9e3c7t0gmxd        c1f53l8w0vto5h2len10   normal    2 weeks ago    6         Washington D.C.   4.6.22_1538_openshift   Katamari                          vpc-gen2
    clusterkkyzh6wfpy6wbvs3iab        c1qreafw0fkrap60erm0   normal    2 days ago     6         Washington D.C.   4.6.22_1538_openshift   Katamari                          vpc-gen2
    clusterkkyzh6wfpy6wjjue2jj        c1h18tgw0nb16n70t7v0   normal    2 weeks ago    6         Washington D.C.   4.6.22_1538_openshift   Katamari                          vpc-gen2
    clusterkwyzh6wfpy6wuoxklxd        c1s56urw0n4ikna9fkag   normal    5 hours ago    6         Washington D.C.   4.6.22_1538_openshift   Katamari                          vpc-gen2
    control-plane-test                c09ad7rd00ib5eomsgjg   normal    2 months ago   9         Dallas            1.19.9_1540             CloudRock                         vpc-gen2
    mcm-002-dal10-c3c.16x32           bv9ivuqd02an8nmtgvmg   normal    4 months ago   6         Dallas            4.5.35_1533_openshift   kata-ibm-saas-sre-console-dev     classic
    ocp-vpc-g2-001                    c0n60h5d0olkp4rik9gg   normal    1 month ago    6         Dallas            4.5.35_1533_openshift   Katamari                          vpc-gen2
    oss-classic-mcm-dal12-b3c.8x32    bub7ro2d0brafs3d6kgg   warning   5 months ago   6         Dallas            4.4.33_1536_openshift   kata-ibm-saas-sre-console-dev     classic
    renlei-vpc-east-2-bx2.16x64       c1104npw05p9g2hu0ah0   normal    1 month ago    6         Washington D.C.   4.6.22_1538_openshift   Katamari                          vpc-gen2
    security-networking-infra-test    c1ngk53d0g9tnbivm420   normal    1 week ago     9         Dallas            4.6.22_1538_openshift   Katamari                          vpc-gen2
    sos-landing-devops                bvurp4td05t73vuileng   warning   3 months ago   3         Dallas            4.5.35_1533_openshift   kata-ibm-saas-sre-console-dev     classic
    srecluster2                       c0l0t1gd091h38696d5g   normal    1 month ago    3         Dallas            1.18.17_1546            Default                           classic
    us-east-e2e-provision-demo        bvl9ls6d0q2b7le2ks20   normal    3 months ago   9         Dallas            1.19.9_1540             kata-ibm-saas-control-plane-dev   vpc-gen2
```
*************************************************************************************












### So let’s give access to what we want/need.  In this case, do my own cluster and another. 
    ibmcloud ks cluster config –cluster <clustername> 

```console
    - example:  
        - ibmcloud ks cluster config --cluster arose-security-controls

    OK
    The configuration for arose-security-controls was downloaded successfully.

    Added context for arose-security-controls to the current kubeconfig file.
    You can now execute 'kubectl' commands against your cluster. For example, run 'kubectl get nodes'.
    If you are accessing the cluster for the first time, 'kubectl' commands might fail for a few seconds while RBAC synchronizes.
```
*************************************************************************************












### Run kubectl config get-contexts again, and see the changes
    kubectl config get-contexts

```console
    CURRENT   NAME                                           CLUSTER                                        AUTHINFO   NAMESPACE
            CloudRock-CICD/c1hj38rd0ap7jkh2lcd0            CloudRock-CICD/c1hj38rd0ap7jkh2lcd0                       default
    *         arose-security-controls/c1o6a74d02rdum9lv0f0   arose-security-controls/c1o6a74d02rdum9lv0f0              default
```
*************************************************************************************












### My default above is arose-security-controls, which is what I want.  
To use my cluster, use kubectl config use-context

    kubectl config use-context arose-security-controls/c1o6a74d02rdum9lv0f0

```console
    Switched to context "arose-security-controls/c1o6a74d02rdum9lv0f0".
```
*************************************************************************************












### Take the VPN cert you have requested and copy it into a local directory.  
example: 

    /Users/James.Edwards@ibm.com/Desktop/_workingDev/VPNCERTS_for_automationplatformasaservice/automationplatformasaservice0001.ovpn




### Create a helm config file: 

you will create a yaml file that will be used as the config for the 
"--sos-helm-values" parameter when you use csutil. 

if the cluster is a ROKS cluster,  use the values_os.yaml for this param, 
if the cluster is NOT a ROKS cluster,  use the values_iks.yaml for this param, 
#### if the cluster is a ROKS cluster:
Create a local yaml file:
    /Users/James.Edwards@ibm.com/Desktop/_workingDev/VPNCERTS_for_automationplatformasaservice/values_os.yaml

with the following contents
```
    worker:
        os: "rhel"

    crowdstrike:
    install: true

    changetracker:
    install: true

```

The rhel line is need for a ROKS cluster.  The other 2 entries say to install as part of cluster setup.

#### else if the cluster is not ROKS cluster:
Create a local yaml file:
    /Users/James.Edwards@ibm.com/Desktop/_workingDev/VPNCERTS_for_automationplatformasaservice/values_iks.yaml

with the following contents
```
    crowdstrike:
    install: true

    changetracker:
    install: true

```

*************************************************************************************












### To setup your cluster, run the command

    CERTPATH="/Users/James.Edwards@ibm.com/Desktop/_workingDev/VPNCERTS_for_automationplatformasaservice"
    ibmcloud csutil cluster-setup --crn-service-name=automation-platform-as-a-service --crn-cname=internal --sos-config-path=${CERTPATH}/automationplatformasaservice0001.ovpn arose-security-controls --skip-prometheus --sos-helm-values=${CERTPATH}/values_os.yaml
 
You will be prompted to reboot the API server to finish.  To check progress of install, run command:

    kubectl get all --namespace ibm-services-system

https://w3.sos.ibm.com/inventory.nsf/my_systems.xsp?c_code=armada


*************************************************************************************




















