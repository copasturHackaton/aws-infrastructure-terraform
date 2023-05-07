resource "aws_ecs_cluster" "main" {
  name = var.cluster_name
}

resource "aws_lb" "main" {
  name               = "ecs-alb-${var.env}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.alb_sg_id}"]
  subnets            = ["${var.public_subnet_ids[0]}", "${var.public_subnet_ids[1]}"]

  enable_deletion_protection = false
}

resource "aws_alb_target_group" "main" {
  name        = "TG-Back-end-${var.env}"
  port        = var.backend_container_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_lb.main.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.main.arn
  }
}

resource "aws_alb_listener" "https" {
  load_balancer_arn = aws_lb.main.id
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.main.arn
  }
}
