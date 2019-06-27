**Create a Jenkins job that should send an EmailAlert on every execution.**

Configure extended E-mail notification in Manage jenkins- Configure system



Post build Actions- Editable email notifications


Add trigger- Always 
Add email id to whom you want to send email to.
Apply and Save

**Modify above Jenkins job to send notification only in case of state change i.e when it fails for first time, or succeed after failure**

Configure E-mail notification in Manage jenkins- Configure system



Post build Actions- E-mail notifications
select checkbox: send email for every unstable build.


in Build execute shell give "cd /var/var/var" to make a fail step and recieve notification.

**Modify above Jenkins job to send console output as an attachment.**

