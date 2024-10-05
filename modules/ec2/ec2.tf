locals {
 
 tags = {
   Env  = "Dev"
   }
 }
 


resource "aws_instance" "project" {
  ami = var.ec2-ami
  instance_type = var.ec2-instance-type
  security_groups = [aws_security_group.sg-final.id  ]
  subnet_id = var.ec2-subnet-id
  tags = {
    Name = var.ec2-name
    Env=local.tags.Env
  }
}


resource "aws_security_group" "sg-final" {
    vpc_id = var.vpc-id
   ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }  
  ingress {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}