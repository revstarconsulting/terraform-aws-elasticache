resource "aws_security_group" "redis" {
  name        = "${var.app_name}-redis-sg"
  description = "Security Group for Redis"
  vpc_id      = var.vpc_id

  tags = local.common_tags

  ingress {
    from_port   = local.port
    to_port     = local.port
    protocol    = "tcp"
    cidr_blocks = var.vpc_cidr
    description = "Allow all within VPC"
  }
}
