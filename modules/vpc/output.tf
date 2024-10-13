output "vpc-id" {
  value = aws_vpc.vpc-final-project.id
}

output "subnet-id" {
  value = aws_subnet.subnet-final-project.id
}

output "private-subnet-id" {
  value = aws_subnet.subnet-private-final-project.id
}

