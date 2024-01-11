# terraform.tfvars

# VPC variables
environment         = "dev"
vpc_cidr_block      = "10.0.0.0/16"
availability_zones  = ["eu-west-1a", "eu-west-1b"]

# EC2 instance variables
instance_count      = 2
instance_type       = "t2.micro"
key_name        = "dev-key.pem"
# subnet_ids          = []  # Add subnet IDs based on your configuration





