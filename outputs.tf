output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.cmtr-698agnc5-ec2.public_ip
}

output "key_pair_name" {
  description = "Name of the registered key pair"
  value       = aws_key_pair.cmtr-698agnc5-keypair.key_name
}