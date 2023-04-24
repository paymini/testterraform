# resource "aws_instance" "app_server" {
#   ami           = "ami-0a72af05d27b49ccb"
#   instance_type = "t2.micro"
#   key_name      = "aws_key"
#   subnet_id     = aws_subnet.private_subnet_1.id
#   vpc_security_group_ids = [aws_security_group.main.id]
#   user_data = "${data.template_file.userdata.rendered}"
  
#   tags = {
#     Name = "ExampleAppServerInstance"
#   }
# }

