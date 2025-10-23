# # resource "aws_instance" "web1" {
# #   ami           = "ami-0c02fb55956c7d316"
# #   instance_type = "t2.micro"
# # }

# # resource "aws_instance" "web2" {
# #   ami           = "ami-0c02fb55956c7d316"
# #   instance_type = "t2.micro"
# }


# variable "instance_count" {
#   default = 2
# }

# resource "aws_instance" "web" {
#   count = var.instance_count
#   ami           = "ami-0c02fb55956c7d316"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "web-${count.index + 1}"
#   }
# }

# variable "enviornment" {
#     type = string
#     default = "dev"
# }


# resource "aws_instance" "web-server" {
#     ami = "ami5474486"
#     instance_type = var.enviornment == "prod" ? "t3.medium" : "t2.micro"
  
# }


variable "servers" {
   type = map(object({
    ami = string
    type = string
  }))
  default = {
    "dev" = {
      ami = "ami-87354954",
      type = "t2.micro"
    }
    prod = {
      ami = "ami-6524871",
      type = "t3.micro"
    }
  }
}


resource "aws_instance" "server" {
  for_each = var.servers
  ami = each.value.ami
  instance_type = each.value.type

  tags = {
    Name = each.key 
  }
}


