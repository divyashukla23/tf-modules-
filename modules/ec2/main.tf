
resource "aws_instance" "this" {
  # count = 3
  for_each = var.instances
  ami                    = each.value["ami"]
  instance_type          = each.value["type"]
  vpc_security_group_ids = var.security_groups
  subnet_id              = var.subnet_id

  tags = {
    Name = "web"
  }
}
