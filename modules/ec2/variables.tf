variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default = "ami-0199d4b5b8b4fde0e"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default = "t3.micro"
}

variable "security_groups" {
  description = "List of Security Group IDs"
  type        = list(string)
  default = [ "sg-06de8b5e496c20b87" ]
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instance"
  type        = string
  default = "subnet-0fda173856a3087e2"
}

variable "instance_name" {
  description = "Tag name for instance"
  type        = string
  default = "instance_demo"
}
