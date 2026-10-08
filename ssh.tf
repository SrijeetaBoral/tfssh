locals {
  name_prefix = var.project_id
  tags = {
    Project = var.project_tag
    ID      = var.project_id
  }
}

resource "aws_key_pair" "cmtr-698agnc5-keypair" {
  key_name   = "${local.name_prefix}-keypair"
  public_key = var.ssh_key
  tags       = local.tags
}