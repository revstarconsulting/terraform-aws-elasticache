locals {
  port           = var.port == "" ? var.engine == "redis" ? "6379" : "11211" : var.port
  identifier     = "${var.app_name}-${var.environment}"
  engine         = var.engine == "" ? "redis" : var.engine
  engine_version = var.engine_version == "" ? "6.x" : var.engine_version
}

resource "aws_elasticache_subnet_group" "default" {
  name        = lower(var.app_name)
  description = format("For ElastiCache %s", local.identifier)
  subnet_ids  = var.private_subnets

}

resource "aws_elasticache_cluster" "default" {
  cluster_id                 = local.identifier
  engine                     = local.engine
  node_type                  = var.node_type
  num_cache_nodes            = var.num_cache_nodes
  parameter_group_name       = aws_elasticache_parameter_group.default.id
  engine_version             = local.engine_version
  port                       = local.port
  subnet_group_name          = aws_elasticache_subnet_group.default.name
  security_group_ids         = [aws_security_group.redis.id]
  auto_minor_version_upgrade = false
  apply_immediately          = var.apply_immediately
  tags                       = local.common_tags

}

resource "aws_elasticache_parameter_group" "default" {
  name   = "${local.identifier}-param-gp"
  family = var.db_family

}

