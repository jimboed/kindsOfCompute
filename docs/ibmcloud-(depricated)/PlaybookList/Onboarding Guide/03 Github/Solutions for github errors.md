

# Challenges and solutions while updtating the Playbook in the Visual Studio code 
 

#### Error message:

vscode make sure you configure your 'user.name' and 'user. email' in git

#### Proposed Solution:

    git config --global user.email '<git-commit-address>'
    git config --global user.user '<git-username>'

    git config --global --list 
    
The above command helps to configure the email and user name.

*************************************************************************************

#### Error Message:

 Git not found

#### Proposed Solution:

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

The above comand identifies the hidden git folder and eliminates the error.

*************************************************************************************