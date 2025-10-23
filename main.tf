terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3.0"

  #  backend "s3" {
  #   bucket         = "terraform-state-divya"
  #   key            = "dev/terraform.tfstate"
  #   region         = "ap-south-1"
  #   dynamodb_table = "terraform-locks"
  #   encrypt        = true 
  # }
}

provider "aws" {
  region = var.aws_region
}
# instances = {
#   web1 = {
#       ami = "ami-078675757"
#       type = "t2.micro"
#     }

#   web2 = {
#       ami = "ami-645464"
#       type = "t2.large"
#     }
#   }
module "ec2_server" {
  source          = "./modules/ec2"
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  security_groups = var.security_groups
  subnet_id       = var.subnet_id
  instance_name   = var.instance_name
}

output "instance_id" {
  value = module.ec2_server.instance_id
}

output "instance_public_ip" {
  value = module.ec2_server.public_ip
}



# REMOTE STATE LOCKING
# aws dynamodb create-table \
  # --table-name terraform-locks \
  # --attribute-definitions AttributeName=LockID,AttributeType=S \
  # --key-schema AttributeName=LockID,KeyType=HASH \
  # --billing-mode PAY_PER_REQUEST

# aws s3api create-bucket \                                                 ─╯
#   --bucket terraform-state-divya \
#   --region ap-south-1 \
#   --create-bucket-configuration LocationConstraint=ap-south-1