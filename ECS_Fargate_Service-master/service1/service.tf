resource "aws_cloudwatch_log_group" "main" {
  name = format("/ecs/%s/%s/%s", var.dns_name,var.account_environment,var.task_family_name)
}

#Defining template file jenkins
data "template_file" "task_def" {
  template = file("task_definitions/service.json")
  vars = {
    image_name = var.image_name
    task_family_name = var.task_family_name
    port = var.port_8080
    region = var.region
    log_group = aws_cloudwatch_log_group.main.name
    }
}

#ECS Task Definition jenkins
resource "aws_ecs_task_definition" "ecs_task_def_jenkins" {
  family                   = format("ecs-%s-%s-%s",var.dns_name, var.account_environment, var.task_family_name)
  container_definitions    = data.template_file.task_def.rendered
  execution_role_arn       = var.ecs_role
  task_role_arn            = var.ecs_role
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 2048
  network_mode             = "awsvpc"
}

resource "aws_ecs_service" "service_jenkins" {
  name            = format("ecs-%s-%s-%s-service",var.dns_name, var.account_environment, var.task_family_name)
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.ecs_task_def_jenkins.arn
  desired_count   = var.replicas
  launch_type     = "FARGATE" 
  network_configuration {
    security_groups = [var.web_sg]
    subnets         = var.private_subnets
    assign_public_ip = false
  }
  load_balancer {
    target_group_arn = var.service_tg_arn
    container_name   = var.task_family_name
    container_port   = var.port_8080
  }
}





#Defining template file nginx
data "template_file" "ecs_task_def_nginx" {
  template = file("task_definitions/service.json")
  vars = {
    image_name = var.image_name_nginx
    task_family_name = var.task_family_name_nginx
    port = var.port_nginx
    region = var.region
    log_group = aws_cloudwatch_log_group.main.name
    }
}


#ECS Task Definition nginx

resource "aws_ecs_task_definition" "ecs_task_def_nginx" {
  family                   = format("ecs-%s-%s-%s",var.dns_name, var.account_environment, var.task_family_name_nginx)
  container_definitions    = data.template_file.ecs_task_def_nginx.rendered
  execution_role_arn       = var.ecs_role
  task_role_arn            = var.ecs_role
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 2048
  network_mode             = "awsvpc"
}

resource "aws_ecs_service" "service_nginx" {
  name            = format("ecs-%s-%s-%s-service",var.dns_name, var.account_environment, var.task_family_name_nginx)
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.ecs_task_def_nginx.arn
  desired_count   = var.replicas
  launch_type     = "FARGATE" 
  network_configuration {
    security_groups = [var.web_sg]
    subnets         = var.private_subnets
    assign_public_ip = false
  }
  load_balancer {
    target_group_arn = var.service_tg_arn_nginx
    container_name   = var.task_family_name_nginx 
    container_port   = var.port_nginx
  }
}






 
#Defining template file apache
data "template_file" "task_def_apache" {
  template = file("task_definitions/service.json")
  vars = {
    image_name = var.image_name_apache
    task_family_name = var.task_family_name_apache
    port = var.port_apache
    region = var.region
    log_group = aws_cloudwatch_log_group.main.name
    }
}


#ECS Task Definition apache

resource "aws_ecs_task_definition" "ecs_task_def_apache" {
  family                   = format("ecs-%s-%s-%s",var.dns_name, var.account_environment, var.task_family_name_apache)
  container_definitions    = data.template_file.task_def_apache.rendered
  execution_role_arn       = var.ecs_role
  task_role_arn            = var.ecs_role
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 2048
  network_mode             = "awsvpc"
}

resource "aws_ecs_service" "service-apache" {
  name            = format("ecs-%s-%s-%s-service",var.dns_name, var.account_environment, var.task_family_name_apache)
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.ecs_task_def_apache.arn
  desired_count   = var.replicas
  launch_type     = "FARGATE" 
  network_configuration {
    security_groups = [var.web_sg]
    subnets         = var.private_subnets
    assign_public_ip = false
  }
  load_balancer {
    target_group_arn = var.service_tg_arn_apache
    container_name   = var.task_family_name_apache
    container_port   = var.port_apache
  }
}
