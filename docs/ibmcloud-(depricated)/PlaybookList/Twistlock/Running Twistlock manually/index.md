

# Running Twistlock Manually

*************************************************************************************
## 00 Overview

https://github.ibm.com/IBMPrivateCloud/twistlock-tool

Steps to run twistlock manually

- 00 overview
- 01 Download twistlock binary
- 02 adjust file permissions
- 03 Check Twistlock dependencies
- 04 get a list of the images to submit to twistlock
- 05 credentials
- 06 submit to twistlock


*************************************************************************************

## 01 Download twistlock binary
* NOTE: twistlock is only available to for Linux and macOS

Run the following to download the binaries and unzip: 

    wget --no-check-certificate https://twistlock-service.cloudpaklab.ibm.com/download/tt_latest.zip
    unzip tt_latest.zip

*************************************************************************************

## 02 adjust file permissions

Depending on if youre running linux or macos, cd into that directory, and change permissions:

    cd tt_*/linux_x86_64      # <---- if LINUX
    # cd tt_*/macos_x86_64    # <---- else if MACOS

    chmod 755 ./tt

 
*************************************************************************************

## 03 Check Twistlock dependencies
Twistlock may have some additional dependencies that need to be installed on your local computer in order to function properly. 

To the the list of dependencies, run the following: 

    ./tt check-dependencies



*************************************************************************************

## 04 get a list of the images to submit to twistlock

The image list can be submitted with one image, or a list

- docker.io/rabbitmq:latest
- bogus.registry.io/hello-world:latest




*************************************************************************************

## 05 credentials

you will need: 

- a W3_USERID
- a W3_PASSWORD 
- an IAM API key for REMOTE-IMAGE registries ending with icr.io EXCEPT cp.icr.io, cp.stg.icr.io
    - this is not required to run twistlock, only for specific registries. 

*************************************************************************************

## 06 submit to twistlock
using the example image list above, append the list as comma separated, with NO SPACES as the final argument to the the twistlock call. 


W3_USERID=<username>

W3_PASSWORD=<pa$$word>



for just json results:  

    ./tt images pull-and-scan --user $W3_USERID:$W3_PASSWORD --output-format json --control-group automation-platform  docker.io/rabbitmq:latest,bogus.registry.io/hello-world:latest

for just csv results: 

    ./tt images pull-and-scan --user $W3_USERID:$W3_PASSWORD --output-format csv --control-group automation-platform docker.io/rabbitmq:latest,bogus.registry.io/hello-world:latest

for just csv AND json results: 

    ./tt images pull-and-scan --user $W3_USERID:$W3_PASSWORD --output-format csv-and-json --control-group automation-platform docker.io/rabbitmq:latest,bogus.registry.io/hello-world:latest



*************************************************************************************
