resource "aws_ecs_cluster" "main" {
  name = "${terraform.workspace}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name = aws_ecs_cluster.main.name

  capacity_providers = [
    "FARGATE",     # For Fargate workloads
    "FARGATE_SPOT" # Optional: For cost optimization
  ]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 100
  }
}