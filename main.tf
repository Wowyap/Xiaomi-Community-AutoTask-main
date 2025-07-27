provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "pokemon_key" {
  key_name   = "pokemon-key"
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "pokemon_sg" {
  name        = "pokemon-sg"
  description = "Allow SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "pokemon_ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.pokemon_key.key_name
  security_groups = [aws_security_group.pokemon_sg.name]
  user_data     = file("user_data.sh")

  tags = {
    Name = "PokemonApp"
  }
}