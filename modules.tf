module "networking" {
  source = "./modules/networking"

  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets_cidr
  private_subnets = var.private_subnets_cidr
  az_list         = var.az_list
  tags            = var.tags
  igw_name        = var.igw_name
  nat_gw_name     = var.nat_gw_name
}


module "security" {
  source = "./modules/security"

  env                    = var.env
  alb_name               = var.alb_name
  vpc_id                 = module.networking.vpc_id
  backend_container_port = var.backend_container_port
  backend_app_name       = var.backend_app_name
}


module "backend_repository" {
  source = "./modules/repository"

  tags     = var.tags
  app_name = var.backend_app_name
  env      = var.env
}


module "ecs_cluster" {
  source = "./modules/ecs"

  cluster_name                  = var.cluster_name
  certificate_arn               = module.acm.certificate_arn
  env                           = var.env
  vpc_id                        = module.networking.vpc_id
  public_subnet_ids             = module.networking.public_subnet_ids
  private_subnet_ids            = module.networking.private_subnet_ids
  alb_sg_id                     = module.security.alb_sg_id
  backend_container_image       = module.backend_repository.container_image
  backend_app_name              = var.backend_app_name
  backend_task_role_arn         = module.security.task_role_arn
  backend_execution_role_arn    = module.security.execution_role_arn
  backend_desired_count_service = var.backend_desired_count_service
  backend_container_port        = var.backend_container_port
  backend_sg                    = module.security.backend_ecs_task_sg
}

module "acm" {
  source = "./modules/certificate"

  domain_name = var.domain_name
}