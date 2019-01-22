# variable.tf

variable "AWS_REGION" {
  default = "ap-southeast-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykeypair"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykeypair.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    ap-southeast-1 = "ami-8e0205f2"
  }
}
