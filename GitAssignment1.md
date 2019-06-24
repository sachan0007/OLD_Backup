#VSFTPD<br/>
Launch EC2 instance<br/>
Add TCP rules for port:Open FTP Ports <br/>
20-21: 0.0.0.0/0<br/>
1024-1048: 0.0.0.0/0<br/>
yum install vsftpd<br/>
nano /etc/vsftpd/vsftpd.conf<br/>
Edit vsftpd.conf and make changes/add as below:<br/>
chroot_local_user=NO<br/>
pasv_enable=YES<br/>
pasv_min_port=1024<br/>
pasv_max_port=1048<br/>
pasv_address=13.232.199.170 (Public IP of instance)<br/>
To keep it start on instance restart<br/>
chkconfig --level 345 vsftpd on<br/>
systemctl start vsftpd<br/>
Add user for ftp<br/>
adduser abhishek<br/>
passwd abhishek<br/>
Provide password twice<br/>
Restrict user to home directory in vsftpd.conf:<br/>
chroot_local_user=YES<br/>
systemctl restart vsftpd<br/>
Change / Set user’s FTP home directory & give group permissions:<br/>
usermod -d /etc/vsftpd/users/abhi  abhishek<br/>
Go to this directory and run -- ls to check list permissions<br/>
my current user is root, I will add new user to this group only<br/>
usermod -a -G root abhishek<br/>
systemctl restart vsftpd<br/>
Recheck few things is problem in connecting to it, in vsftp.config:<br/>
chroot_local_user=YES<br/>
write_enable=YES<br/>
allow_writeable_chroot=YES (for writing permission to local user)<br/>
<br/>
To connect I am using WinSCP on windows system:<br/>
give puclic ip of instance <br/>
Username and password of user we created<br/>
BANG!!!!! I can access /etc/vsftpd/users/abhi<br/>

