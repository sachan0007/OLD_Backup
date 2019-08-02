 AWS Assignment Day-3


Task 1

Create a linux t2.micro ec2 instance. After logging into this instance move /etc/sudoers file with /etc/sudoers.bkp


Now try to login, If can't - resolve this issue


Task 2

create an ansible role before pushing the same to your public github repository.


This Role will simply host an nginx webpage saying


"Hi i am ninja and my name is {yourname}"


Execute this role in user data script while launching another instance


Your website should be up & running after the system boots up


tag this instance as ninja:yourname


Task 3

write a jobDsl to start stop this instance through jenkins


NOTE!

Make Documentation
Don't commit and push your AWS Keys on any public repository    

----------------------------------------------------------------------  

Task1:  
Start a other Debug Linux Instance.  
Make sure that it is running in the same Availability Zone as the sacrificial server.  
Fix the bad Server:  
Stop but do not terminate the bad server, detach bad server root drive and attach it to debug server,  
then mount its root disk drive as a normal data drive on the debug server, to get access to the sudoer file.   
Rename sudoers.bkp to sudoers.  

```
 $ cd /
 $ sudo mkdir bad
 $ sudo mount /dev/xvdf /bad 
```
```
 $ cd /bad
 $ ls 
```
sudo mv /etc/sudoers.bkp /etc/sudoers  

Detach EBS from debug server and attach it again to bad server.  
Start bad server and login... BANG....it works!!!  

-------------------------------------------------------------------------  

