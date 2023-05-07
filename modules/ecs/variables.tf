variable "vpc_id" {
  description = "VPC ID for ECS cluster"
}

variable "cluster_name" {
  description = "Cluster ECS name"
}

variable "public_subnet_ids" {
  description = "Public Subnet IDs"
}

variable "private_subnet_ids" {
  description = "Private Subnet IDs"
}

variable "backend_app_name" {
  description = "Back-end app name"
}

variable "backend_container_port" {
  description = "Back-end Container port"
}

variable "backend_container_image" {
  description = "Back-end Container image"
}

variable "backend_desired_count_service" {
  description = "Back-end Desired count service"
}

variable "backend_execution_role_arn" {
  description = "Back-end ARN for execution role"
}

variable "backend_task_role_arn" {
  description = "Back-end ARN for task role"
}

variable "env" {
  description = "Resources default prefix / tag"
}

variable "alb_sg_id" {
  description = "Application Load Balancer Security Group ID"
}

variable "backend_sg" {
  description = "Security Group ID ECS Backend Tasks"
}

variable "certificate_arn" {
  description = "Amazon Certificate Manager ARN"
}