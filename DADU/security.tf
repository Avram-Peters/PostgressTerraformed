provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
  profile = var.profile
}

data "aws_vpc" "selected" {
  tags = {
    Name = var.vpc
  }
}

resource "aws_security_group" "dadu-rds" {
  name = "dadu-rds"
  description = "Security group specific to Daugherty University DA Database"
  vpc_id = data.aws_vpc.selected.id
  tags = local.common_tags
}

resource "aws_security_group_rule" "postgres_access" {
  type = "ingress"
  from_port = 5432
  to_port = 5432
  protocol = "tcp"
  cidr_blocks = ["192.94.40.70/32", "192.94.40.40/32"]

  security_group_id = aws_security_group.dadu-rds.id
}

resource "aws_security_group_rule" "ssh_access" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["192.94.40.70/32", "192.94.40.40/32"]

  security_group_id = aws_security_group.dadu-rds.id
}