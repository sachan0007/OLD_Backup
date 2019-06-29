**Create a Jenkins job(InstallPackage) that will take a package name as input and install it in local system.**

create package string parameter.
Configure execute shell with this parameter.

![Img](Images/39.jpg)

**Modify InstallPackage jenkins job to take remote system IP as input to install the package.**

**Modify InstallPackage jenkins job so that it should be able to support different types of OS such as:

Ubuntu 14/16
CentOS 6/7**



**Modify InstallPackage jenkins job to take additional parameters for remote system to be managed:

ssh username
PrivateKey file**



**Modify InstallPackage jenkins job where a drop down will be provided of remote systems to be managed.
Modify InstallPackage jenkins job where checkboxes are provided for multiple remote systems.**

**Create below users in your system
dev
qa
devops
qa user should be allowed only to execute the InstallPackage jenkins job
dev user should be allowed to execute and view the content of InstallPackage jenkins job
devops user should be admin of Jenkins server**
