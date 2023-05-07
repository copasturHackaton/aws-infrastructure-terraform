resource "aws_security_group" "alb-sg" {
  name   = "${var.alb_name}-sg"
  vpc_id = var.vpc_id

  ingress {
    protocol         = "tcp"
    from_port        = var.backend_container_port
    to_port          = var.backend_container_port
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    protocol         = "-1"
    from_port        = 0
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "backend_ecs_task" {
  name   = "${var.backend_app_name}-sg-task-${var.env}"
  vpc_id = var.vpc_id

  ingress {
    protocol         = "tcp"
    from_port        = var.backend_container_port
    to_port          = var.backend_container_port
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    protocol         = "-1"
    from_port        = 0
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
