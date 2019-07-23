#!/bin/bash
version=3.17.0-01
DIR="/opt/nexus"
getPackageManager()
{
    if ! which apt
    then
       echo "yum"

    elif ! which yum
    then
       echo "apt"
    else
       echo "None of package manager, apt or yum found"
       exit 1
    fi
    }
check_package ()
{
  if [ -d "$DIR" ];
   then echo "yes"
  fi
}
install_package_yum ()
{
  result=`check_package`
  if [ $result == "yes" ];
    then echo "Package is already installed"
  else
    yum -y install java-1.8.0-openjdk
    cd /opt
    wget https://download.sonatype.com/nexus/3/nexus-$version-unix.tar.gz
    tar -zxvf  nexus-$version-unix.tar.gz
    mv /opt/nexus-$version /opt/nexus
    useradd nexus
    chown -R nexus:nexus $DIR
    chown -R nexus:nexus /opt/sonatype-work
    echo "run_as_user="nexus"" > $DIR/bin/nexus.rc
    sh -c "echo 'nexus   ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers"
    ln -s $DIR/bin/nexus /etc/init.d/nexus
    cd /etc/init.d
    chkconfig --level 345 nexus on
    /etc/init.d/nexus start
  fi
}

install_package_apt ()
{
  result=`check_package`
  if [ $result == "yes" ];
    then echo "Package is already installed"
  else
    apt-get -y install java-1.8.0-openjdk
    cd /opt
    wget https://download.sonatype.com/nexus/3/nexus-$version-unix.tar.gz
    tar -zxvf  nexus-$version-unix.tar.gz
    mv /opt/nexus-$version /opt/nexus
    adduser nexus
    chown -R nexus:nexus $DIR
    chown -R nexus:nexus /opt/sonatype-work
    echo "run_as_user="nexus"" > $DIR/bin/nexus.rc
    sh -c "echo 'nexus   ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers"
    ln -s $DIR/bin/nexus /etc/init.d/nexus
    cd /etc/init.d
    chkconfig --level 345 nexus on
    /etc/init.d/nexus start
  fi
}


pm=$(getPackageManager)
if [ $pm == "yum" ]
then
   install_package_yum
elif [ $pm == "apt" ]
then
   install_package_apt
else
   echo "Something went wrong!!!!!!!!!"
fi
