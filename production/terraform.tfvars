# environments/prod/terraform.tfvars

# VPC variables
environment        = "prod"
vpc_cidr_block     = "10.1.0.0/16"
availability_zones = ["eu-central-1a", "eu-central-1b"]

# EC2 instance variables
instance_count     = 2
instance_type      = "t2.micro"
key_name           = "prod-key.pem"
subnet_ids         = []  # You may leave this empty for now
