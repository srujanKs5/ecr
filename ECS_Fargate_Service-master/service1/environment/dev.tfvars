region = "us-east-1"

#Environment information
dns_name = "indigo"
account_environment = "dev"
#################
image_name = ""
ecs_role = "arn:aws:iam::232115254087:role/indigo-dev-iam-role"
ecs_cluster_id = "indigo-dev-ecs-cluster"
web_sg = ""
private_subnets = [
"subnet-0bf0f3ad2df9fd56a",
"subnet-0111b5a0e26d56bbb"
]
service_tg_arn = ""
##########################
task_family_name = "port8080-service"
port = "8080"
replicas = "1"




image_name = "nginx"
ecs_role = "arn:aws:iam::232115254087:role/indigo-dev-iam-role"
ecs_cluster_id = "indigo-dev-ecs-cluster"
web_sg = ""
private_subnets = [
"subnet-0bf0f3ad2df9fd56a",
"subnet-0111b5a0e26d56bbb"
]

service_tg_arn = ""
##########################
task_family_name = "port8081-service"
port = "8081"
replicas = "1"






image_name = "apache"
ecs_role = "arn:aws:iam::232115254087:role/indigo-dev-iam-role"
ecs_cluster_id = "indigo-dev-ecs-cluster"
web_sg = ""
private_subnets = [
"subnet-0bf0f3ad2df9fd56a",
"subnet-0111b5a0e26d56bbb"
]

service_tg_arn = ""
##########################
task_family_name = "port8082-service"
port = "8082"
replicas = "1"


