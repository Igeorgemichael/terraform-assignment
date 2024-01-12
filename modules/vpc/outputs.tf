output "subnet_ids" {
  value = aws_subnet.subnet[*].id
}

output "security_group_id" {
  value = aws_security_group.main.id
}

output "availability_zones" {
  value = var.availability_zones
}

# output the subnet cidr
output "subnet_cidr" {
  value = aws_subnet.subnet[*].cidr_block
}

