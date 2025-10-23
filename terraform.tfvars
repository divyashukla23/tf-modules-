aws_region      = "ap-south-1"
ami_id          = "ami-0c02fb55956c7d316" # Amazon Linux 2
instance_type   = "t2.small"
subnet_id       = "subnet-0a12345bc678de910"
security_groups = ["sg-0123456789abcdef0"]
instance_name   = "terraform-modular-demo"

instances = {
  web1 = {
      ami = "ami-078675757"
      type = "t2.micro"
    }

  web2 = {
      ami = "ami-645464"
      type = "t2.large"
    }
  }