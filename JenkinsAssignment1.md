Create a freestyle job to print "Hello world".
================================================================
My Views- New Item
Give Item name
Click FreestyleProject-OK
General-Add Build steps
echo "Hello World"
From left pane click - Build now
See build history for last build item.

Output:-
 Started by user Abhishek Sachan Running as SYSTEM Building in workspace 
/var/lib/jenkins/workspace/Hello_World [Hello_World] $ /bin/sh -xe 
/tmp/jenkins6458105352823298885.sh + echo 'Hello World' Hello World Finished: SUCCESS 
==============================================================================
Create a freestyle job to which take absolute path of a directory then
Print a message "drectory not exist" if directory doesn't exist on file system
Print "Inappropriate permissions" if you don't have permissions to list files.

https://www.cyberciti.biz/faq/unix-linux-test-existence-of-file-in-bash/ 
https://www.cyberciti.biz/faq/unix-linux-test-existence-of-file-in-bash/ 

My Views- New Item
Give Item name
Click FreestyleProject-OK
General-Build execute shell
cd /var/lib/jenkins/
ls
file="JenkinsAssignment1.md"
if [ -f "$file" ]
then
	echo "$file exist"
else
	echo "$file not exist"
fi
ls 
if [ $? -eq 0 ];
then
        echo "Here is the list"
else
        echo "Inappropriate permissions"
fi


From left pane click - Build now
See build history for last build item.

Output:-
Started by user Abhishek Sachan
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/Hello_World
[Hello_World] $ /bin/sh -xe /tmp/jenkins2455843676668928253.sh
+ cd /var/lib/jenkins/
+ ls
assignment.sh
config.xml
credentials.xml
fingerprints
hudson.model.UpdateCenter.xml
hudson.plugins.emailext.ExtendedEmailPublisher.xml
hudson.plugins.git.GitTool.xml
identity.key.enc
jenkins.install.InstallUtil.lastExecVersion
jenkins.install.UpgradeWizard.state
jenkins.model.DownloadSettings.xml
jenkins.model.JenkinsLocationConfiguration.xml
jenkins.security.apitoken.ApiTokenPropertyConfiguration.xml
jenkins.security.QueueItemAuthenticatorConfiguration.xml
jenkins.security.UpdateSiteWarningsConfiguration.xml
jenkins.telemetry.Correlator.xml
jobs
logs
nodeMonitors.xml
nodes
plugins
queue.xml
queue.xml.bak
secret.key
secret.key.not-so-secret
secrets
spring3hibernate
training.sh
updates
userContent
users
workflow-libs
workspace
+ file=JenkinsAssignment1.md
+ '[' -f JenkinsAssignment1.md ']'
+ echo 'JenkinsAssignment1.md not exist'
JenkinsAssignment1.md not exist
+ ls
assignment.sh
config.xml
credentials.xml
fingerprints
hudson.model.UpdateCenter.xml
hudson.plugins.emailext.ExtendedEmailPublisher.xml
hudson.plugins.git.GitTool.xml
identity.key.enc
jenkins.install.InstallUtil.lastExecVersion
jenkins.install.UpgradeWizard.state
jenkins.model.DownloadSettings.xml
jenkins.model.JenkinsLocationConfiguration.xml
jenkins.security.apitoken.ApiTokenPropertyConfiguration.xml
jenkins.security.QueueItemAuthenticatorConfiguration.xml
jenkins.security.UpdateSiteWarningsConfiguration.xml
jenkins.telemetry.Correlator.xml
jobs
logs
nodeMonitors.xml
nodes
plugins
queue.xml
queue.xml.bak
secret.key
secret.key.not-so-secret
secrets
spring3hibernate
training.sh
updates
userContent
users
workflow-libs
workspace
+ '[' 0 -eq 0 ']'
+ echo 'Here is the list'
Here is the list
Finished: SUCCESS
=======================================================================================
Update the previously created freestyle job to only retain last 10 build history
but not beyond 2 days.

Download and install "Discard Old Build" Plugin
Go to configure- Genral- post build action
Add post build action- Discard old builds
Days to keep build=2
Max # of builds to keep=10
===================================================================================

Clone the code available in the same repository.
Using git protocol:-

Create freestyle project
General- Source Code Management- git
Repository URL: https://github.com/sachan007/private.git (Private repo)
add user with github user and pass 
select created credentials from dropdown
apply and save
build now

Console output:
Started by user Abhishek Sachan
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/Clone-git_Protocol
using credential 2ea3989f-8b8a-421d-9e59-3335d75f3047
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/sachan007/private.git # timeout=10
Fetching upstream changes from https://github.com/sachan007/private.git
 > git --version # timeout=10
using GIT_ASKPASS to set credentials 
 > git fetch --tags --progress https://github.com/sachan007/private.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision f44d1f86e5539323a85e7a48f68f04ee33a93532 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f f44d1f86e5539323a85e7a48f68f04ee33a93532
Commit message: "Initial commit"
First time build. Skipping changelog.
Finished: SUCCESS

===========================================================================
Clone the code available in the same repository.
Using ssh protocol:-
-generate key for jenkins access in jenkins root directory as jenkins user (/var/lib/jenkins)
Go to  /var/lib/jenkins
Switch to jenkins user: 
# su jenkins
# ssh-keygen
#cd .ssh
#Find file …..pub
#Cat id_rsa.pub
Copy public key and add this in settings in Github (ssh and gcc key)
Now go to jenkins and create credentials to be used for git in jenkins
Credentials- system- global credentials unrestricted- Add credentials- 
Kind- username and password
Give Github username and password.
SSH user is now created


Create freestyle project
General- Source Code Management- git
Repository URL: git@github.com:sachan007/private.git (Private repo)
select credentials none
apply and save
build now

console output:
Started by user Abhishek Sachan
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/Clone-git_Protocol
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git@github.com:sachan007/private.git # timeout=10
Fetching upstream changes from git@github.com:sachan007/private.git
 > git --version # timeout=10
 > git fetch --tags --progress git@github.com:sachan007/private.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision f44d1f86e5539323a85e7a48f68f04ee33a93532 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f f44d1f86e5539323a85e7a48f68f04ee33a93532
Commit message: "Initial commit"
 > git rev-list --no-walk f44d1f86e5539323a85e7a48f68f04ee33a93532 # timeout=10
Finished: SUCCESS

=============================================================================
Update above jenkins job so that it should be able to identify if there is a
code commit in last 5 minutes it should get triggered.

Configure above job
Source Code Management- Check : Branches to build (means which branch you want to check)
Build Triggers-Poll SCM
Schedule- H/5 * * * *
Apply and save

Now create a file in your project in jenkins workspace 
push to the repo in branch specified in source code management section of jenkins console.

Go to build history-check status
You will see changes as below and who triggered this build

Changes
1. test2 (detail / githubweb)
Started by an SCM change
Revision: d20dcd5a26017f0cd5c764f5c4450ed0b1a9828c
refs/remotes/origin/abhi

=============================================================================
Enable colored console output:
Install plugin- ANSIcolor
To print red color Add in build- execute shell: echo -e "\033[31mRed\033[0m"
build now
observe output console
