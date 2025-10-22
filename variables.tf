variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_groups" {
  description = "Security groups list"
  type        = list(string)
}

variable "instance_name" {
  description = "Instance tag name"
  type        = string
}
