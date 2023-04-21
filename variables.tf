

############################# 
# FROM WORKSPACE
#############################
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  description = "create in region"
  type = string
  default = "us-east-1"
}

# variable "access_key" {
#   type = string
#   default = var.access_key
# }
# variable "secret_key" {
#   type = string
#   default = var.secret_key
# }