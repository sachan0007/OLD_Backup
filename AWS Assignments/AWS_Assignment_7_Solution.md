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

