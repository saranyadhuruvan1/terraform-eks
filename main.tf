terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# -------------------------------
# Fetch Default VPC & Subnets
# -------------------------------
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "availability-zone"
    values = ["us-east-1a", "us-east-1b", "us-east-1c"]
  }
}

# -------------------------------
# Call EKS Module
# -------------------------------
module "eks" {
  source = "./modules/eks"

  cluster_name = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = data.aws_vpc.default.id
  subnet_ids = data.aws_subnets.default.ids

  node_instance_type = var.node_instance_type
  desired_size        = var.desired_size
  min_size            = var.min_size
  max_size            = var.max_size
  disk_size           = var.disk_size
}
