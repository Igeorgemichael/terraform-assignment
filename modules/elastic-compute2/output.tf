# modules/ec2/output.tf

output "instance_ids" {
  value = aws_instance.main[*].id
}

output "public_ip_addresses" {
  value = aws_instance.main[*].public_ip
}
