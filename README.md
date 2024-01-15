# DevOps Test

## Creating Scalable Application:

I’ve created a scalable application in AWS using the security best practices. To ensure scalability, I have implemented auto-scaling groups that automatically adjust the number of instances based on the workload currently for testing purposes I just have added 1 instance everywhere in min, max, and desire so it will not scale but in production cases, we can increase them. Additionally, I have utilized load balancers to distribute traffic evenly across multiple instances, improving performance and availability. For security, I’ve deployed all Ec-2 instances in the private subnets and deployed the load balancer in the public subnet. 

## Architecture Overview:
![image](https://drive.google.com/uc?export=view&id=12FHcAtYklS616u1M0UrBzUR1ksn3JOUq)

The above architecture diagram is created using https://github.com/mingrammer/diagrams and here is the code:

```python
from diagrams import Diagram, Cluster
from diagrams.aws.compute import EC2, AutoScaling
from diagrams.aws.network import VPC, PrivateSubnet, PublicSubnet
from diagrams.aws.network import ElasticLoadBalancing
from diagrams.onprem.network import Internet

with Diagram("Application Deployment", show=False):
    internet = Internet("Internet")
    with Cluster("AWS"):
        with Cluster("VPC"):
            # vpc = VPC("VPC")
            with Cluster("Public Subnet"):
                # public_subnet = PublicSubnet("Public Subnet")
                elb = ElasticLoadBalancing("ELB")
            with Cluster("Private Subnet"):
                # private_subnet = PrivateSubnet("Private Subnet")
                asg = AutoScaling("ASG")
                instances = [EC2("Instance1"), EC2("Instance2")]

    internet >>  elb >> asg >> instances
```

### Steps to run this task:

- To make the infra up do the following steps

```bash
git clone [https://github.com/rp-arun/devops-assign.git](https://github.com/rp-arun/devops-assign.git)
```

```bash
cd infra/environments/kerol-systems/
```

```bash
terraform init
terraform plan
terraform apply
```

Add the necessary variables like aws role, secret key, and access keys.

## Access:

To access the application:

[http://app-elb-1243328729.us-west-2.elb.amazonaws.com/](http://app-elb-1243328729.us-west-2.elb.amazonaws.com/)
