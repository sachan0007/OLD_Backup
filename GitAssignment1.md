VSFTPD:---
===========================================================================
Launch EC2 instance
Add TCP rules for port:Open FTP Ports 
20-21: 0.0.0.0/0
1024-1048: 0.0.0.0/0
#yum install vsftpd
#nano /etc/vsftpd/vsftpd.conf
Edit vsftpd.conf and make changes/add as below:
chroot_local_user=NO
pasv_enable=YES
pasv_min_port=1024
pasv_max_port=1048
pasv_address=13.232.199.170 (Public IP of instance)
To keep it start on instance restart
#chkconfig --level 345 vsftpd on
#systemctl start vsftpd
Add user for ftp
#adduser abhishek
#passwd abhishek
Provide password twice
Restrict user to home directory in vsftpd.conf:
chroot_local_user=YES
#systemctl restart vsftpd
Change / Set user’s FTP home directory & give group permissions:
#usermod -d /etc/vsftpd/users/abhi  abhishek
Go to this directory and run -- ls to check list permissions
my current user is root, I will add new user to this group only
#usermod -a -G root abhishek
#systemctl restart vsftpd
Recheck few things is problem in connecting to it, in vsftp.config:
chroot_local_user=YES
write_enable=YES
allow_writeable_chroot=YES (for writing permission to local user)

To connect I am using WinSCP on windows system:
give puclic ip of instance 
Username and password of user we created
BANG!!!!! I can access /etc/vsftpd/users/abhi
==========================================================================
