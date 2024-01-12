# environments/prod/main.tf

# module for vpc block
module "vpc" {
  source          = "../modules/vpc"
  environment     = var.environment
  vpc_cidr_block  = var.vpc_cidr_block
  availability_zones = var.availability_zones
}

# module for ec2 block
module "ec2_instance" {
  source            = "../modules/ec2"
  environment       = var.environment
  instance_count    = var.instance_count
  instance_type     = var.instance_type
  keypair_name      = var.key_name
  subnet_ids        = module.vpc.subnet_ids
  security_group_id = module.vpc.security_group_id
}


# output the public ip addresses of the instance
output "public_ip_addresses" {
  value = module.ec2_instance.public_ip_addresses
}

# output the instance ids 
output "instance_ids" {
  value = module.ec2_instance.instance_ids
}

# output the subnet ids 
output "subnet_ids" {
  value = module.vpc.subnet_ids
}

# output the security group id
output "security_group_id" {
  value = module.vpc.security_group_id
}

# output the availability zones
output "availability_zones" {
  value = module.vpc.availability_zones
}
