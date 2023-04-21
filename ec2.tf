resource "aws_instance" "app_server" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name      = "aws_key"

  vpc_security_group_ids = [aws_security_group.ec2.id]
  user_data = "${data.template_file.userdata.rendered}"
  
  tags = {
    Name = "ExampleAppServerInstance"
  }
}

