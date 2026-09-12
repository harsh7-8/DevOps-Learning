terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_security_group" "WMP-project-sg" {
  name = "WMP-project-sg"
}

resource "aws_instance" "wmp_instances" {
  for_each = var.instances

  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow.id]

  tags = {
    Name    = each.value
    Project = "WMP"
    env     = "non-prd"
  }
}