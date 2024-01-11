# environment/variables.tf

variable "environment" {
  description = "Environment name (dev, prod, etc.)"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 2
}

# variable "ami" {
#   description = "AMI ID for the EC2 instances"
#   type        = string
#   default     = "ami-0c55b159cbfafe1f0"
# }

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

# variable "subnet_ids" {
#   description = "List of subnet IDs where EC2 instances will be launched"
#   type        = list(string)
#   default     = []
#   # set default values if needed or leave it empty based on your use case
# }
