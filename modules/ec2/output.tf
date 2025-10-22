output "instance_id" {
  description = "The IDs of the EC2 instances being created"
  value       = aws_instance.web[*].id
  
}

output "public_ip" {
  description = "The public IPs of the EC2 instances"
  value       = aws_instance.web[*].public_ip
  
}