variable "env" {
  description = "Environment prefix / tag"
}

variable "alb_name" {
  description = "Application Load Balancer name"
}

variable "backend_app_name" {
  description = "Back-end app name"
}

variable "backend_container_port" {
  description = "Back-end_container port"
}

variable "vpc_id" {
  description = "VPC ID"
}