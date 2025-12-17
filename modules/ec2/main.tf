variable "ami" {}
variable "instance_type" {}

resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
}

