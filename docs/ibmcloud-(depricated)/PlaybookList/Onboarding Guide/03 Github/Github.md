

## 03 github Setup 

Below steps are used to gain acess to github account:

- Add a new SSH key to your GitHub account

The new id can be accessed by using the link: https://docs.github.com/en/enterprise-server@3.0/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

Once the github account is set up we can test is using the below command in the termail

    ssh -T git@github.ibm.com

This would initiate a waring:

>The authenticity of host 'hostname (IP ADDRESS)' can't be established.
> RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
> Are you sure you want to continue connecting (yes/no)?

Verify the fingerprint and once it matches select the "yes" option

*************************************************************************************

