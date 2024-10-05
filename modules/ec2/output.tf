output "ec2-id" {
  value = aws_instance.project.id
}

output "ec2-ssh" {
  value = "ubuntu@${aws_instance.project.id}"
}
