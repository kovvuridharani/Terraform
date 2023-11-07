provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAUWA6ID2FSXRUITGZ"
  secret_key = "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"
}
resource "aws_security_group" "web_access01" {
  name        = "web_access01"
  description = "allow ssh and http"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}
#security group end here


resource "aws_instance" "web-server" {
  ami             = "ami-05c13eab67c5d8861"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.web_access01.name}"]
  tags = {
    Name     = "hello-World"
    Stage    = "testing"
    Location = "INDIA"
  }

}
      
