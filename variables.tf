variable "aws_region" {
  description = "AWS region to deploy the EKS cluster in"
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "demo-eks"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}

variable "desired_node_capacity" {
  description = "Desired number of worker nodes in the node group"
  type        = number
  default     = 2
}

variable "max_node_capacity" {
  description = "Maximum number of worker nodes in the node group"
  type        = number
  default     = 2
}

variable "min_node_capacity" {
  description = "Minimum number of worker nodes in the node group"
  type        = number
  default     = 1
}


