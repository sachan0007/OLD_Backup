AWS Assignment Day-1


Task 1

Create a vpc through wizard, having one public subnet and one private subnet.


Task 2

Create two instances within the vpc that you created in task 1, windows instance in public subnet and linux instance in private subnet. check if linux is pingable from windows and vice versa.


Task 3

Delete all the instances and now make those two instances that you created in previous task using aws-cli.


NOTE!

Make Documentation and push to the repo

-------------------------------------------------------------------------------  



#!/bin/bash  
aws ec2 run-instances --image-id ami-028b3bf1662e6082f --count 1 --instance-type t2.micro --key-name NewKeyPair --security-group-ids sg-03449092e569f8ca8 --subnet-id subnet-04910167cace25904 --associate-public-ip-address  
aws ec2 run-instances --image-id ami-0d2692b6acea72ee6 --count 1 --instance-type t2.micro --key-name NewKeyPair --security-group-ids sg-0baacf0b18161c7a7 --subnet-id subnet-0468e71ec6139e19b  




```
PS C:\Users\abhisheks8\.aws> aws ec2 run-instances --image-id ami-028b3bf1662e6082f --count 1 --instance-type t2.micro --key-name NewKeyPair --security-group-ids sg-03449092e569f8ca8 --subnet-id subnet-04910167cace25904 --associate-public-ip-address
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-028b3bf1662e6082f",
            "InstanceId": "i-0a6270946bc602a5a",
            "InstanceType": "t2.micro",
            "KeyName": "NewKeyPair",
            "LaunchTime": "2019-07-29T16:37:42.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-south-1a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "Platform": "windows",
            "PrivateDnsName": "ip-10-0-0-30.ap-south-1.compute.internal",
            "PrivateIpAddress": "10.0.0.30",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-04910167cace25904",
            "VpcId": "vpc-02424afb9342cb87d",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2019-07-29T16:37:42.000Z",
                        "AttachmentId": "eni-attach-07a999dba9e810913",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "Public-HTTP-HTTPS-SSH-ICMP",
                            "GroupId": "sg-03449092e569f8ca8"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:6d:61:a4:7f:60",
                    "NetworkInterfaceId": "eni-0d42f7d1a40bea8ed",
                    "OwnerId": "882209190643",
                    "PrivateIpAddress": "10.0.0.30",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.0.30"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-04910167cace25904",
                    "VpcId": "vpc-02424afb9342cb87d"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "Public-HTTP-HTTPS-SSH-ICMP",
                    "GroupId": "sg-03449092e569f8ca8"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            }
        }
    ],
    "OwnerId": "882209190643",
    "ReservationId": "r-0baec00d842aed44f"
}

```




```
PS C:\Users\abhisheks8\.aws> aws ec2 run-instances --image-id ami-0d2692b6acea72ee6 --count 1 --instance-type t2.micro -
-key-name NewKeyPair --security-group-ids sg-0baacf0b18161c7a7 --subnet-id subnet-0468e71ec6139e19b
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0d2692b6acea72ee6",
            "InstanceId": "i-0f91a501c41139e4b",
            "InstanceType": "t2.micro",
            "KeyName": "NewKeyPair",
            "LaunchTime": "2019-07-29T16:48:54.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-south-1a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-0-84.ap-south-1.compute.internal",
            "PrivateIpAddress": "10.0.0.84",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0468e71ec6139e19b",
            "VpcId": "vpc-02424afb9342cb87d",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2019-07-29T16:48:54.000Z",
                        "AttachmentId": "eni-attach-0c0e53bddd655ed21",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "default",
                            "GroupId": "sg-0baacf0b18161c7a7"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:ae:0a:53:97:4c",
                    "NetworkInterfaceId": "eni-04aadb7834ea9930a",
                    "OwnerId": "882209190643",
                    "PrivateIpAddress": "10.0.0.84",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.0.84"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0468e71ec6139e19b",
                    "VpcId": "vpc-02424afb9342cb87d"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "default",
                    "GroupId": "sg-0baacf0b18161c7a7"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            }
        }
    ],
    "OwnerId": "882209190643",
    "ReservationId": "r-02ab4398c30c4f005"
}
```



