terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
      }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"

    tags = {
        Name = "Testing World"
    }

}