output "container_image" {
  value = aws_ecr_repository.ecr_repository.repository_url
}
