resource "aws_ecs_task_definition" "backend-ecs-task" {
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = var.backend_execution_role_arn
  task_role_arn            = var.backend_task_role_arn
  family                   = "ecs-${var.backend_app_name}"
  container_definitions    = <<TASK_DEFINITION
[
  {
    "cpu": 10,
    "environment": [],
    "essential": true,
    "image": "${var.backend_container_image}",
    "name": "${var.backend_app_name}",
    "portMappings": [
      {
        "containerPort": ${var.backend_container_port},
        "hostPort": ${var.backend_container_port}
      }
    ]
  }
]
TASK_DEFINITION
}

resource "aws_ecs_service" "backend-ecs-service" {
  name                               = "${var.backend_app_name}-svc"
  cluster                            = aws_ecs_cluster.main.id
  task_definition                    = aws_ecs_task_definition.backend-ecs-task.arn
  desired_count                      = var.backend_desired_count_service
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"

  network_configuration {
    security_groups  = [var.backend_sg]
    subnets          = [var.private_subnet_ids.0, var.private_subnet_ids.1]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.main.id
    container_name   = var.backend_app_name
    container_port   = var.backend_container_port
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
}

resource "aws_appautoscaling_target" "backend_ecs_target" {
  max_capacity       = 6
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.backend-ecs-service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}
