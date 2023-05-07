output "alb_sg_id" {
  value = aws_security_group.alb-sg.id
}

output "execution_role_arn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}

output "task_role_arn" {
  value = aws_iam_role.ecs_task_role.arn
}

output "backend_ecs_task_sg" {
  value = aws_security_group.backend_ecs_task.id
}