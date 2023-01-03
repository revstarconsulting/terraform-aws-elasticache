variable "engine" {
  default     = "redis"
  type        = string
  description = "redis or memcached"
}

variable "engine_version" {
  type        = string
  default     = ""
  description = "engine version"
}

variable "port" {
  type    = string
  default = ""
}

variable "db_family" {
  type    = string
  default = ""

}

variable "private_subnets" {
  type        = list(string)
  description = "private subnets"
}

variable "vpc_cidr" {
  type        = list(string)
  description = "vpc cidr block for security group rule"
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "app_name" {
  description = "app name"
  type        = string
}

variable "environment" {
  type        = string
  description = "environment"
}

variable "node_type" {
  type        = string
  description = "cache node type"
}

variable "num_cache_nodes" {
  default     = 1
  description = "number of cache nodes"
}

variable "apply_immediately" {
  type        = bool
  default     = true
  description = "whether apply changes immediately or not"
}

locals {
  common_tags = {
    environment = var.environment
  }

}

