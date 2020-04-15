variable "region_name" {
  type=string
}
variable "container_image" {
  type=string
}
variable "environment_name" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "availability_zones" {
  type = list(string)
}
variable "public_subnets_ids" {
  type = list(string)
}
variable "private_subnets_ids" {
  type = list(string)
}



