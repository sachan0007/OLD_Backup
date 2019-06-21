########[Git] Create a Jenkins job that will create a tag using Git plugin.
Install Git Parameter Plug-in
Create freestyle project- git-tag
General
Check- This project is parameterized
git parameter- give name 
name - Tag
Parameter Type- Tag
Default Value- origin/master
NOTE: make sure source code management sectiion is configured with git repo.
Apply-save
Build now
=============================================================================
########[Maven] Create a maven based jenkins job to build the code available in same repository.
Install maven integration plugin
Create maven project- maven
Source code management- git- same as above
make sure repo have code which maven can build
Build-
Root POM - /var/lib/jenkins/workspace/maven/pom.xml
Goals and options- clean install
Apply -save

==============================================================================
########[SSH Plugin] Run a script to find out top 5 files as major contributor to disk space
Syntax to be used:
du -hsx -- * | sort -rh | head -5 (to list with in current directory)
find / -type f -printf '%s %p\n'| sort -nr | head -5
OR
find / -type f -iname "*.mp4" -printf '%s %p\n'| sort -nr | head -10
##Not completed via SSH plugin
==============================================================================
########[HTML Publisher]: Create a Jenkins job that will generate a HTML file for the commits happened in last 10 days and publishes it as HTML report
install HTML Publisher plugin configure previous job Build-Execute 
shell-Commans-Add command below git log --since=10.days Save and apply 
build now 
============================================================================== 
[Copy Artifacts]: Create 2 Jenkins job 
ArtifactBuilder: This job will checkout the code corresponding to a static website and build artifact.
ArtifactDeployer: This job will use the artifact built from previous job and deploys it to a target server. Also make sure that this job will not run when ArtifactBuilder job is running and vice versa.

install-Copy Artifact Plugin (TO copy archive artifacts and copy from other project)
Install- Join plugin to trigger downstream job

##ArtifactBuilder:
I have used last maven project as "ArtifactBuilder" and to archive artifacts
Configure few changes in maven job.
NOTE: We need to archive artifacts in first job in order to make them accessible to next job to copy them.

Changes made to maven project:
General: Permission to Copy Artifact- copy-artifacts (name given to job instead of ArtifactDeployer)
Source code mgmt and Build section are as were before to create .war 
Post-build Actions:-
Archive the artifacts- target/Spring3HibernateApp.war (artifact we want to archive)
Build other projects- Copy-Artifacts (Select project you want to trigger automatically after this job)
Apply and save

Status:
Success Build #7 (21-Jun-2019 14:53:57)
add description
	Build Artifacts
	Spring3HibernateApp.war	20.59 MB	 view
	No changes.
	
Started by user Abhishek Sachan

	Revision: c20680326544fce7fc33a1ab62ef90fbeb4d8774
refs/remotes/origin/master
	Test Result (no failures)
Module Builds
Success Spring3HibernateApp	38 sec


##ArtifactDeployer:(I named it Copy-Artifacts)
Create new freestyle project
Build:-
Project name- maven (name of project from which artifacts will be copied)
Which build- Latest Successful Build
Artifacts to copy- target/Spring3HibernateApp.war (artifact you want to copy from project maven)
Target directory-/var/www/html (where you want to paste those unarchived artifacts)

NOTE: make sure jenkins have permission to copy into this directory, or give it permission.
setfacl -m user:jenkins:rwx /var/www/html

Status:
Build #8 (21-Jun-2019 14:54:52)
add description
	No changes. Changes in dependency
Spring3HibernateApp Success#6 →  Success#7 (detail)
	
Started by upstream project maven build number 7
originally caused by:

Started by user Abhishek Sachan
Upstream Builds
mavenSuccess#7
