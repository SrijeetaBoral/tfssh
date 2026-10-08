data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["${local.name_prefix}-vpc"]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }
}

data "aws_subnet" "public" {
  id = sort(data.aws_subnets.public.ids)[0]
}

data "aws_security_group" "ssh" {
  filter {
    name   = "group-name"
    values = ["${local.name_prefix}-sg"]
  }
  vpc_id = data.aws_vpc.main.id
}

data "aws_ssm_parameter" "al2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "cmtr-698agnc5-ec2" {
  ami                         = data.aws_ssm_parameter.al2023.value
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnet.public.id
  vpc_security_group_ids      = [data.aws_security_group.ssh.id]
  key_name                    = aws_key_pair.cmtr-698agnc5-keypair.key_name
  associate_public_ip_address = true

  tags = merge(local.tags, { Name = "${local.name_prefix}-ec2" })
}