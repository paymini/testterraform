resource "aws_key_pair" "localtest" {
  key_name   = "aws_key"
  public_key = var.aws_key
}
