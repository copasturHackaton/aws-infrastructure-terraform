output "alb_dns_name" {
  value = module.ecs_cluster.alb_dns_name
}

output "backend_container_image" {
  value = module.backend_repository.container_image
}
