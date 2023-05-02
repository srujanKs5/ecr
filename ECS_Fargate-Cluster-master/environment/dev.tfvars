region = "us-east-1"

#Environment information
dns_name = "indigo"
account_environment = "dev"
availability_zones = [
  "us-east-1a",
  "us-east-1b"
]

public_hosted_zone = "Z08435971CHFM0F55VBEV"
alb_certificate = "arn:aws:acm:us-east-1:379117363028:certificate/39945260-74e4-412b-8df1-cf0a4ef2ef83"

#node group details
ami_type = "AL2_x86_64"
disk_size = "20"
instance_types = ["t3.medium"]
desired_size = "1"
max_size = "1"
min_size = "1"
