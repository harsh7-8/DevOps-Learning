variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  default = "t3.small"
}

variable "instances" {
  type = map(string)
  default = {
    frontend          = "frontend"
    postgresql        = "postgresql"
    auth_service      = "auth-service"
    portfolio_service = "portfolio-service"
    analytics_service = "analytics-service"
    # wmp-ansible         = "workstations"
  }
}