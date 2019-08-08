AWS

Task 1

Rajat is the devops guy in 'abc' organization and he is responsible for creating 't2.micro' and all the 'm' family of instances as per requirement,  
but he can't terminate 'm' family of instances but that's not the case with t2.micro.  
Tejasvi Rana has got root access to the account but he isn't a technical guy.  
He is always suspicious about Rajat's actions in company's aws account.  
Luckily Tejasvi has got a friend, Priyanka jugran, she is amazon certified and knows everything about aws.  
Tejasvi wants Priyanka to cross check rajat's IAM permissions. In order to do that, he gave priyanaka full access.  
Now priyanka needs s3 storage for one of her friend, priyanka sharama to run athena queries for data analysis,  
they don't want to pay for that from their own aws account.  
Jugran has created a bucket with name 'abc-data' with a policy that  
sharma will only be able to access this bucket from a particular ec2 instance that she created & provided the user details to sharma.  
Rajat referenced his friends kavit and vishwas to his organization and now all of then share the same permission level.
Kushgra is also one of the team memebers from operations team but recently  
he has got a task to create and run lambda function that is going to access rds database.


How many IAM groups gets created
How many IAM users gets created
Permissions associated with them


NOTE!

Make Documentation

Task 2


Create an infrastructure that would scale as per load:
Create cloudwatch alarms for scaling up and scaling down along with sns topic to notify you during any scaling operation


Put fake load on the stack
scale up if av. cpu threashold > 70
scale down if av. cpu threashold < 40
First do it via console and then via aws cli


NOTE!

Make sure you explore other matrices as well for scaling like memory, network etc..
Make Documentation  

-------------------------------------------------------------------    

Users:  

1) Rajat: In "Devops" group With user policy as bolow:  
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "RunInstance",
            "Effect": "Allow",
            "Action": "ec2:RunInstances",
            "Resource": "*",
            "Condition": {
                "StringLikeIfExists": {
                    "ec2:InstanceType": [
                        "t2.micro",
                        "m4.*",
                        "m5.*",
                        "m5d.*"
                    ]
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": "ec2:TerminateInstances",
            "Resource": [
                "*"
            ],
            "Condition": {
                "StringEquals": {
                    "ec2:InstanceType": [
                        "t2.micro"
                    ]
                }
            }
        },
        {
            "Sid": "DescribeActions",
            "Effect": "Allow",
            "Action": [
                "ec2:*"
            ],
            "Resource": "*"
        }
    ]
}
```
2) Tejasvi and Priyanka jugran in same GROUP: With AdministratorAccess policy attached.  
3) priyanka sharama (From her account only): Will use role to run athena queries.  

The role she will use to run the Athena query must have permission to 

* run queries in Athena,  
* access the catalog objects (i.e. databases and tables)  
* access to an S3 bucket where query results can be stored, and  
* access to th
* S3 bucket and objects that need to be read to run the query.  

Also role will be attached to EC2 instance and Bucket(abc-data) will be having policy as below.  
```
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Deny",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::abc-data/*",
            "Condition": {
                "NotIpAddress": {
                    "aws:SourceIp": [
                        "IP of that instance"
                    ]
                }
            }
        }
    ]
}
```
4) kavit and vishwas: added to same group "Devops" as Rajat  
5) Kushgra: Will also be in same group as above and a seperate role will be attached to him to create and invoke Lambda function.      

We need to enable VPC access for the Lambda function, during which you will assign it a Security Group.  
Then, within the Security Group assigned to the RDS instance you will enable access for the Security Group assigned to the Lambda function.  

---------------------------------------------------------------------------  

**Task2:**  

```
#!/bin/bash
set -e
 
AS='ScalingGroup'
LC='LaunchConfig'
 
# create launch config
aws autoscaling create-launch-configuration \
    --launch-configuration-name $LC \
    --image-id ami-0b3046001e1ba9a99 \
    --instance-type t2.micro \
    --instance-monitoring '{"Enabled": true}' \
    --security-groups MySecurityGroup \
    --key-name NewKeyPair
 
# create AS group
aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name $AS \
    --launch-configuration-name $LC \
    --availability-zones ap-south-1a ap-south-1b \
    --min-size 1 \
    --max-size 5 \
    --health-check-type EC2 \
    --health-check-grace-period 300
 
UP=$(aws autoscaling put-scaling-policy --auto-scaling-group-name $AS --policy-name Scale-UP --scaling-adjustment 1 --adjustment-type ChangeInCapacity --cooldown 60 | jq -r '.PolicyARN')
DOWN=$(aws autoscaling put-scaling-policy --auto-scaling-group-name $AS --policy-name Scale-DOWN --scaling-adjustment -1 --adjustment-type ChangeInCapacity --cooldown 60 | jq -r '.PolicyARN')
 
aws cloudwatch put-metric-alarm \
    --alarm-name $AS-CPUHigh \
    --metric-name CPUUtilization \
    --namespace "AWS/EC2" \
    --period 300 \
    --evaluation-periods 1 \
    --threshold 70 \
    --statistic Average \
    --comparison-operator GreaterThanThreshold \
    --alarm-actions $UP \
    --dimensions Name=AutoScalingGroupName,Value=$AS
 
aws cloudwatch put-metric-alarm \
    --alarm-name $AS-CPULow \
    --metric-name CPUUtilization \
    --namespace "AWS/EC2" \
    --period 300 \
    --evaluation-periods 1 \
    --threshold 40 \
    --statistic Average \
    --comparison-operator LessThanThreshold \
    --alarm-actions $DOWN \
    --dimensions Name=AutoScalingGroupName,Value=$AS
 
# Enable AS group (not instance) metrics in CloudWatch
aws autoscaling enable-metrics-collection \
    --auto-scaling-group-name $AS \
    --granularity 1Minute \
    --metrics GroupInServiceInstances GroupTotalInstances
    
# Create SNS topic
Topic_arn=`aws sns create-topic \
    --name EmailNotification | jq -r '.TopicArn'`
    
# Add subscription to topic
aws sns subscribe \
    --topic-arn $Topic_arn \
    --protocol email \
    --notification-endpoint abhisheksachaneee@gmail.com
    
# Add notification to AS group
aws autoscaling put-notification-configuration \
    --auto-scaling-group-name $AS \
    --topic-arn $Topic_arn \
    --notification-type autoscaling:EC2_INSTANCE_LAUNCH \
                        autoscaling:EC2_INSTANCE_LAUNCH_ERROR \
                        autoscaling:EC2_INSTANCE_TERMINATE \
                        autoscaling:EC2_INSTANCE_TERMINATE_ERROR
       
```
                 
