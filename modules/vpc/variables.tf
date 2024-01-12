# modules/vpc/variables.tf

# variable for environment (dev, prod)
variable "environment" {
  description = "Environment name (dev, prod)"
  type        = string
}

# variable for vpc cidr block
variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# variable for availability zones
variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}
