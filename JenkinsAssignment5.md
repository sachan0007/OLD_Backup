**Create a Jenkins job that should send an EmailAlert on every execution.**

Configure extended E-mail notification in Manage jenkins- Configure system

![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/6.png)

Post build Actions- Editable email notifications

![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/7.png)

Add trigger- Always 
Add email id to whom you want to send email to.
Apply and Save

![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/8.png)
![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/9.png)


**Modify above Jenkins job to send notification only in case of state change i.e when it fails for first time, or succeed after failure**

Configure E-mail notification in Manage jenkins- Configure system

![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/10png)

Post build Actions- E-mail notifications
select checkbox: send email for every unstable build.
![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/11.png)

in Build execute shell give "cd /var/var/var" to make a fail step and recieve notification.
![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/12.png)

Build job

![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/13.png)


**Modify above Jenkins job to send console output as an attachment.**

Add trigger- Always 
Add email id to whom you want to send email to.
Select attach build log in dropdown to send output as attachment.
Apply and Save

![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/14.png)
![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/15.png)

**Modify above Jenkins job to add console output as mail body instead of attachment.**

Go to Extended E-mail notification configuration
Add this in default content: "<pre>${BUILD_LOG, maxLines=9999, escapeHtml=false}</pre>"

![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/16.png)
![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/17.png)


**Create a Jenkins job(ManageUser) that will take a user name as input and create it in local system.**

Create JOB ManageUser
Check: This project is parameterized.
Give Username as parameter.

![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/18.png)

In build execute shell add command to use that parameter and create user.
Also add "id $username" to get info of user after creation.
NOTE: Add jenkins to not get prompted for password when using sudo.To do that add "jenkins ALL=(ALL) NOPASSWD:ALL" in 
![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/22.png)
![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/19.png)

Build project with parameter.

![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/20.png)
![Img](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/21.png)



