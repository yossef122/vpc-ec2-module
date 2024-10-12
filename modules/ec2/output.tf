output "ec2-ip" {
  value = aws_instance.project.ip
}

output "ec2-ssh" {
  value = "ubuntu@${aws_instance.project.ip}"
}
