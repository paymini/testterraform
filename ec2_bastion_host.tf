resource "aws_instance" "bastion_host" {
  ami           = "ami-0a72af05d27b49ccb"
  instance_type = "t2.micro"
  key_name      = "aws_key"
  subnet_id     = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.bastion.id]
  user_data = "${data.template_file.userdata.rendered}"
  associate_public_ip_address = true
  tags = {
    Name = "my-bastion-host"
  }
}


# # Create a security group for the Bastion host
# resource "aws_security_group" "bastion_security_group" {
#   name_prefix = "bastion-sg-"
#   vpc_id      = aws_vpc.example_vpc.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
resource "aws_security_group" "bastion" {
#   name        = "Bastion host of ${local.project}"
  name        = "Bastion host of"

  description = "Allow SSH access to bastion host and outbound internet access"
  vpc_id      = aws_vpc.example_vpc.id

  lifecycle {
    create_before_destroy = true
  }

#   tags = {
#     Project = local.project
#   }
}

resource "aws_security_group_rule" "ssh" {
  protocol          = "TCP"
  from_port         = 22
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion.id
}

resource "aws_security_group_rule" "internet" {
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion.id
}

# resource "aws_security_group_rule" "intranet" {
#   protocol          = "-1"
#   from_port         = 0
#   to_port           = 0
#   type              = "egress"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.bastion.id
# }
