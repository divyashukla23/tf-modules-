# # # resource "aws_instance" "web1" {
# # #   ami           = "ami-0c02fb55956c7d316"
# # #   instance_type = "t2.micro"
# # # }

# # # resource "aws_instance" "web2" {
# # #   ami           = "ami-0c02fb55956c7d316"
# # #   instance_type = "t2.micro"
# # }


# # variable "instance_count" {
# #   default = 2
# # }

# # resource "aws_instance" "web" {
# #   count = var.instance_count
# #   ami           = "ami-0c02fb55956c7d316"
# #   instance_type = "t2.micro"

# #   tags = {
# #     Name = "web-${count.index + 1}"
# #   }
# # }

# # variable "enviornment" {
# #     type = string
# #     default = "dev"
# # }


# # resource "aws_instance" "web-server" {
# #     ami = "ami5474486"
# #     instance_type = var.enviornment == "prod" ? "t3.medium" : "t2.micro"
  
# # }


# variable "servers" {
#    type = map(object({
#     ami = string
#     type = string
#   }))
#   default = {
#     "dev" = {
#       ami = "ami-87354954",
#       type = "t2.micro"
#     }
#     prod = {
#       ami = "ami-6524871",
#       type = "t3.micro"
#     }
#   }
# }


# resource "aws_instance" "server" {
#   for_each = var.servers
#   ami = each.value.ami
#   instance_type = each.value.type

#   tags = {
#     Name = each.key 
#   }
# }


# resource "aws_s3_bucket" "count_demo" {

#   count = 3
#   bucket = "tf-count-demo-${count.index + 1}"
#   acl = "private" 
# }

resource "aws_security_group" "web" {

  name = "example-sg"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# syntax for dynamic block: 
# dynamic "<block name>" {
#   for_each = <ITERABLE>
#   content {
      # ATTRIBUTE FOR THE BLOCK 
# }
# }

variable "ingress_rules" {
  default = [
 { from_port=22, to_port=22, protocol= "tcp"},
{ from_port=80, to_port=80, protocol= "tcp"},
 { from_port=443, to_port=443, protocol= "tcp"}
  ]
}

resource "aws_security_group" "web" {

  name = "example-sg"

  dynamic "ingress" {

    for_each = var.ingress_rules
    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
      }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}