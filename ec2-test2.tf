resource "aws_instance" "app_server-dup" {
  ami           = "ami-0a72af05d27b49ccb"
  instance_type = "t2.micro"
  key_name      = "aws_key"

  vpc_security_group_ids = [aws_security_group.app_server-dup.id]
  user_data = "${data.template_file.userdata.rendered}"
  
  tags = {
    Name = "ExampleAppServerInstance-dup"
  }
}

# Create a security group for the Bastion host
resource "aws_security_group" "app_server-dup" {
  name_prefix = "app_server-dup-sg-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}