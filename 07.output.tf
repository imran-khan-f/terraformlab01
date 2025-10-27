# output for public ip
output "ec2-instance-public-ip" {
  description = "ec2 instance public ip"
  value       = aws_instance.Myinstance-010.public_ip
}

#output for public ip
output "ec2-instance-private-ip" {
  description = "ec2 instance private ip"
  value       = aws_instance.Myinstance-010.private_ip
}

#output for ec2 arn no
output "ARN-number" {
  description = "ec2 arn no"
  value       = aws_instance.Myinstance-010.arn
}