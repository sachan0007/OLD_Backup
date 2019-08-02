#!/bin/sh

function usage() {
  echo "$0 (start|stop|status)"
}

if [ $# -ne 1 ]; then
  usage
fi

REGION=ap-south-1
INSTANCE_ID_NGINX=`aws ec2 describe-instances --filters "Name=tag:Name,Values=nginx" "Name=tag:boot-order,Values=1"  | jq -r '.Reservations[].Instances[].InstanceId'`
INSTANCE_STS_NGINX=`aws ec2 describe-instances --filters "Name=tag:Name,Values=nginx" "Name=tag:boot-order,Values=1"  | jq -r '.Reservations[].Instances[].State.Name'`

INSTANCE_ID_MYAPP=`aws ec2 describe-instances --filters "Name=tag:Name,Values=myapp" "Name=tag:boot-order,Values=2"  | jq -r '.Reservations[].Instances[].InstanceId'`
INSTANCE_STS_MYAPP=`aws ec2 describe-instances --filters "Name=tag:Name,Values=myapp" "Name=tag:boot-order,Values=2"  | jq -r '.Reservations[].Instances[].State.Name'`

INSTANCE_ID_MYDB=`aws ec2 describe-instances --filters "Name=tag:Name,Values=mydb" "Name=tag:boot-order,Values=3"  | jq -r '.Reservations[].Instances[].InstanceId'`
INSTANCE_STS_MYDB=`aws ec2 describe-instances --filters "Name=tag:Name,Values=mydb" "Name=tag:boot-order,Values=3"  | jq -r '.Reservations[].Instances[].State.Name'`

echo "Nginx Instance Status & ID: [$INSTANCE_STS_NGINX][$INSTANCE_ID_NGINX]"
echo "Myapp Instance Status & ID : [$INSTANCE_STS_MYAPP][$INSTANCE_ID_MYAPP]"
echo "Mydb Instance Status & ID : [$INSTANCE_STS_MYDB][$INSTANCE_ID_MYDB]"

if [ "$1" = "start" ]; then

  if [ "$INSTANCE_STS_MYDB" = "running" ]; then
    echo "Mydb instance is already running."
  else
    echo "start mydb instance..."
    aws ec2 start-instances --instance-ids $INSTANCE_ID_MYDB --region $REGION
  fi
  
    if [ "$INSTANCE_STS_MYAPP" = "running" ]; then
    echo "Myapp instance is already running."
  else
    echo "start myapp instance..."
    aws ec2 start-instances --instance-ids $INSTANCE_ID_MYAPP --region $REGION
  fi
  
    if [ "$INSTANCE_STS_NGINX" = "running" ]; then
    echo "Nginx instance is already running."
  else
    echo "start nginx instance..."
    aws ec2 start-instances --instance-ids $INSTANCE_ID_NGINX --region $REGION
  fi
  
elif [ "$1" = "stop" ]; then

  if [ "$INSTANCE_STS_NGINX" = "running" ]; then
    echo "stop nginx instance..."
     aws ec2 stop-instances --instance-ids $INSTANCE_ID_NGINX --region $REGION
  else
    echo "Nginx instance is already stopped."
  fi
  
  if [ "$INSTANCE_STS_MYAPP" = "running" ]; then
    echo "stop myapp instance..."
     aws ec2 stop-instances --instance-ids $INSTANCE_ID_MYAPP --region $REGION
  else
    echo "Myapp instance is already stopped."
  fi
  
  if [ "$INSTANCE_STS_MYDB" = "running" ]; then
    echo "stop mydb instance..."
     aws ec2 stop-instances --instance-ids $INSTANCE_ID_MYDB --region $REGION
  else
    echo "Mydb instance is already stopped."
  fi
  
elif [ "$1" = "status" ]; then

  echo "Status Check only."
  
else
  usage
fi
