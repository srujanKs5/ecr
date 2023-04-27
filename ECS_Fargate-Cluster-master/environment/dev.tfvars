region = "us-east-1"

#Environment information
dns_name = "indigo"
account_environment = "dev"
availability_zones = [
  "us-east-1a",
  "us-east-1b"
]

public_hosted_zone = "Z05515952LWU89Y7GNWFA"
alb_certificate = "arn:aws:acm:us-east-1:232115254087:certificate/ab9ee5bd-bf3a-42f7-bf9b-e1e80346762cf"

#node group details
ami_type = "AL2_x86_64"
disk_size = "20"
instance_types = ["t3.medium"]
desired_size = "1"
max_size = "1"
min_size = "1"
