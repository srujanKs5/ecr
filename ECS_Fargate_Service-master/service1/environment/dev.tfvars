region = "us-east-1"

#Environment information
dns_name = "indigo"
account_environment = "dev"
#################
image_name = ""
ecs_role = ""
ecs_cluster_id = "indigo-dev-ecs-cluster"
web_sg = ""
private_subnets = [
"",
""
]





service_tg_arn = ""
##########################
task_family_name = "port8080-service"
port_8080 = "8080"
replicas = "1"




image_name_nginx = ""

##########################
task_family_name_nginx = "port8081-service"
port_nginx = "8081"
service_tg_arn_nginx = ""





image_name_apache = ""

##########################
task_family_name_apache = "port8082-service"
port_apache = "8082"
service_tg_arn_apache = ""




