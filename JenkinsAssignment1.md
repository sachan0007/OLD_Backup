##Create a freestyle job to print "Hello world".<br/>
My Views- New Item<br/>
Give Item name<br/>
Click FreestyleProject-OK<br/>
General-Add Build steps<br/>
echo "Hello World"<br/>
From left pane click - Build now<br/>
See build history for last build item.<br/>

Output:-<br/>
 Started by user Abhishek Sachan Running as SYSTEM Building in workspace <br/>
/var/lib/jenkins/workspace/Hello_World [Hello_World] $ /bin/sh -xe <br/>
/tmp/jenkins6458105352823298885.sh + echo 'Hello World' Hello World Finished: SUCCESS<br/>
##Create a freestyle job to which take absolute path of a directory then<br/>
##Print a message "drectory not exist" if directory doesn't exist on file system<br/>
##Print "Inappropriate permissions" if you don't have permissions to list files.<br/>
<br/>
https://www.cyberciti.biz/faq/unix-linux-test-existence-of-file-in-bash/ <br/>
https://www.cyberciti.biz/faq/unix-linux-test-existence-of-file-in-bash/ <br/>

My Views- New Item<br/>
Give Item name<br/>
Click FreestyleProject-OK<br/>
General-Build execute shell<br/>
cd /var/lib/jenkins/<br/>
ls<br/>
file="JenkinsAssignment1.md"<br/>
if [ -f "$file" ]<br/>
then<br/>
	echo "$file exist"<br/>
else<br/>
	echo "$file not exist"<br/>
fi<br/>
ls <br/>
if [ $? -eq 0 ];<br/>
then<br/>
        echo "Here is the list"<br/>
else<br/>
        echo "Inappropriate permissions"<br/>
fi<br/>

<br/>
From left pane click - Build now<br/>
See build history for last build item.<br/>

Output:-<br/>
Started by user Abhishek Sachan<br/>
Running as SYSTEM<br/>
Building in workspace /var/lib/jenkins/workspace/Hello_World<br/>
[Hello_World] $ /bin/sh -xe /tmp/jenkins2455843676668928253.sh<br/>
+ cd /var/lib/jenkins/<br/>
+ ls<br/>
assignment.sh<br/>
config.xml<br/>
credentials.xml<br/>
fingerprints<br/>
hudson.model.UpdateCenter.xml<br/>
hudson.plugins.emailext.ExtendedEmailPublisher.xml<br/>
hudson.plugins.git.GitTool.xml<br/>
identity.key.enc<br/>
jenkins.install.InstallUtil.lastExecVersion<br/>
jenkins.install.UpgradeWizard.state<br/>
jenkins.model.DownloadSettings.xml<br/>
jenkins.model.JenkinsLocationConfiguration.xml<br/>
jenkins.security.apitoken.ApiTokenPropertyConfiguration.xml<br/>
jenkins.security.QueueItemAuthenticatorConfiguration.xml<br/>
jenkins.security.UpdateSiteWarningsConfiguration.xml<br/>
jenkins.telemetry.Correlator.xml<br/>
jobs<br/>
logs<br/>
nodeMonitors.xml<br/>
nodes<br/>
plugins<br/>
queue.xml<br/>
queue.xml.bak<br/>
secret.key<br/>
secret.key.not-so-secret<br/>
secrets<br/>
spring3hibernate<br/>
training.sh<br/>
updates<br/>
userContent<br/>
users<br/>
workflow-libs<br/>
workspace<br/>
+ file=JenkinsAssignment1.md<br/>
+ '[' -f JenkinsAssignment1.md ']'<br/>
+ echo 'JenkinsAssignment1.md not exist'<br/>
JenkinsAssignment1.md not exist<br/>
+ ls<br/>
assignment.sh<br/>
config.xml<br/>
credentials.xml<br/>
fingerprints<br/>
hudson.model.UpdateCenter.xml<br/>
hudson.plugins.emailext.ExtendedEmailPublisher.xml<br/>
hudson.plugins.git.GitTool.xml<br/>
identity.key.enc<br/>
jenkins.install.InstallUtil.lastExecVersion<br/>
jenkins.install.UpgradeWizard.state<br/>
jenkins.model.DownloadSettings.xml<br/>
jenkins.model.JenkinsLocationConfiguration.xml<br/>
jenkins.security.apitoken.ApiTokenPropertyConfiguration.xml<br/>
jenkins.security.QueueItemAuthenticatorConfiguration.xml<br/>
jenkins.security.UpdateSiteWarningsConfiguration.xml<br/>
jenkins.telemetry.Correlator.xml<br/>
jobs<br/>
logs<br/>
nodeMonitors.xml<br/>
nodes<br/>
plugins<br/>
queue.xml<br/>
queue.xml.bak<br/>
secret.key<br/>
secret.key.not-so-secret<br/>
secrets<br/>
spring3hibernate<br/>
training.sh<br/>
updates<br/>
userContent<br/>
users<br/>
workflow-libs<br/>
workspace<br/>
+ '[' 0 -eq 0 ']'<br/>
+ echo 'Here is the list'<br/>
Here is the list<br/>
Finished: SUCCESS<br/>

##Update the previously created freestyle job to only retain last 10 build history<br/>
##but not beyond 2 days.<br/>

Download and install "Discard Old Build" Plugin<br/>
Go to configure- Genral- post build action<br/>
Add post build action- Discard old builds<br/>
Days to keep build=2<br/>
Max # of builds to keep=10<br/>


##Clone the code available in the same repository.<br/>
##Using git protocol:-<br/>

Create freestyle project<br/>
General- Source Code Management- git<br/>
Repository URL: https://github.com/sachan007/private.git (Private repo)<br/>
add user with github user and pass <br/>
select created credentials from dropdown<br/>
apply and save<br/>
build now<br/>

Console output:<br/>
Started by user Abhishek Sachan<br/>
Running as SYSTEM<br/>
Building in workspace /var/lib/jenkins/workspace/Clone-git_Protocol<br/>
using credential 2ea3989f-8b8a-421d-9e59-3335d75f3047<br/>
 > git rev-parse --is-inside-work-tree # timeout=10<br/>
Fetching changes from the remote Git repository<br/>
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
##Clone the code available in the same repository.
##Using ssh protocol:-
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
##Update above jenkins job so that it should be able to identify if there is a
##code commit in last 5 minutes it should get triggered.

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

##Enable colored console output:
Install plugin- ANSIcolor
To print red color Add in build- execute shell: echo -e "\033[31mRed\033[0m"
build now
observe output console
