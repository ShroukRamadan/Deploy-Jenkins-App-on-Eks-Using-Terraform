resource "aws_instance" "jump-host" {
  ami           = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id = var.pub-subnet
  vpc_security_group_ids = [aws_security_group.SG.id]
  key_name = var.key_name
  tags = {
    Name = var.Name
  }
  
}


#-------------------------------------------------SG--------------------------------------------------

resource "aws_security_group" "SG" {
  name        = "ssh-sg"
  description = "Allow SSH traffic from anywhere"
  vpc_id = var.vpc-id
 
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