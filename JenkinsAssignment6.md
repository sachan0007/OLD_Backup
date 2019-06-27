**Task**

Let's assume you are working on 3 projects, PROJECT1, PROJECT2, PROJECT3
Project1 has 3 environments DEV, QA, PROD
Project2 has 4 environment DEV, QA, UAT, PROD
Project3 has 5 environment DEV, QA, UAT, PT, PROD
Now as you are already aware for each project you will have CI jobs and deployment jobs, create dummy jobs.
Arrange your jobs in Jenkins in such a fashion that it will be easy to manage them and for a new person it will be pretty easy to understand which job belong to which project.

**Solution:**

Created 5 different views DEV, QA, UAT, PT, PROD and put each projects corresponding view them.

![first](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/1.jpg)
![2](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/2.jpg)
![3](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/3.jpg)
![4](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/4.jpg)
![5](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/Images/5.jpg)


**Task**

Create a Jenkins job(ManageTemplate) that will take a template file, property file(value of variables used in template file) and location as input and then create a file in local system.



Modify ManageTemplate jenkins job to take remote system IP as input to create the file.

Modify ManageTemplate jenkins job to take additional parameters for file to be managed such as:

permission
owner of file
group owner of file


Modify ManageTemplate jenkins job where a drop down will be provided of remote systems to be managed.
Modify ManageTemplate jenkins job where checkboxes are provided for multiple remote systems.
Modify ManageTemplate jenkins job which will take a meta file as an input in below format
host, ip, user, private_key_file, local_template_file_location, local_property_file_location, remote_file_location, file_permission(optional), file_owner(optional), group_owner(optional)
the above said file can have 1 or more entries



