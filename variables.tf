variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "az_list" {
  description = "Availability Zone list"
  type        = list(any)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "cluster_name" {
  description = "Cluster ECS name"
  type        = string
  default     = "equitrip_cluster"
}

variable "backend_app_name" {
  description = "App Name"
  type        = string
  default     = "back_end"
}

variable "env" {
  description = "Default tag and prefix for environment"
  type        = string
  default     = "hackathon"
}

variable "owner" {
  description = "Default tag for owner"
  type        = string
  default     = "brainiax"
}

variable "tags" {
  description = "Default tags"
  type        = map(any)
  default = {
    Env   = "hackathon"
    Owner = "brainiax"
  }
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "equitrip_network"
}

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "172.16.0.0/16"
}

variable "public_subnets_cidr" {
  description = "Public subnets CIDR Block"
  type        = list(any)
  default     = ["172.16.0.0/22", "172.16.4.0/22"]
}

variable "private_subnets_cidr" {
  description = "Private subnets CIDR Block"
  type        = list(any)
  default     = ["172.16.8.0/22", "172.16.12.0/22"]
}

variable "igw_name" {
  description = "Internet Gateway name"
  type        = string
  default     = "igw_prd"
}

variable "nat_gw_name" {
  description = "NAT Gateway name"
  type        = string
  default     = "nat_gw"
}

variable "alb_name" {
  description = "Application Load Balancer name"
  type        = string
  default     = "equitrip_alb"
}

variable "backend_container_port" {
  description = "Back-end container port"
  type        = number
  default     = 3333
}

variable "backend_desired_count_service" {
  description = "Back-end desired count service"
  type        = number
  default     = 3
}

variable "domain_name" {
  description = "Domain name"
  type        = string
  default     = "brainiax.com.br"
}