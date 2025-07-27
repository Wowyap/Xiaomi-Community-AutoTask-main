output "instance_ip" {
  value       = aws_instance.pokemon_ec2.public_ip
  description = "The public IP of the EC2 instance"
}