variable "ami" {}
variable "instance_type" {}

resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
  Name        = "prod-ec2"
  Environment = "prod"
  Owner       = "jenkins-apply-test"
  }
}

