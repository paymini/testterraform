

############################# 
# FROM WORKSPACE
#############################
variable "access_key" {}
variable "secret_key" {}
variable "aws_key" {}


variable "region" {
  description = "create in region"
  type = string
  default = "ap-southeast-1"
}

# variable "access_key" {
#   type = string
#   default = var.access_key
# }
# variable "secret_key" {
#   type = string
#   default = var.secret_key
# }