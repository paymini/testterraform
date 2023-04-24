resource "aws_security_group" "bastion-allow-ssh" {
  vpc_id      = aws_vpc.example_vpc.id
  name        = "bastion-allow-ssh"
  description = "security group for bastion that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "bastion-allow-ssh"
  }
}

resource "aws_security_group" "private-ssh" {
  vpc_id      = aws_vpc.example_vpc.id
  name        = "private-ssh"
  description = "security group for private that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [ aws_security_group.bastion-allow-ssh.id ]
  }
  tags = {
    Name = "private-ssh"
  }
}


resource "aws_instance" "bastion" {
  ami           = ami-0a72af05d27b49ccb
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.bastion-allow-ssh.id]

  key_name = "aws_key"
}

# resource "aws_instance" "private" {
#   ami           = var.AMIS[var.AWS_REGION]
#   instance_type = "t2.micro"
#   subnet_id = aws_subnet.private.id
#   vpc_security_group_ids = [aws_security_group.private-ssh.id]
#   key_name = aws_key_pair.mykeypair.key_name
# }
