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
    

            
