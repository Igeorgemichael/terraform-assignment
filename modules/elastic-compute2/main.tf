# modules/ec2/main.tf

# Create a key pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = var.keypair_name
  public_key = tls_private_key.rsa.public_key_openssh
}

# Create a private key using resource
resource "tls_private_key" "rsa" {
  algorithm   = "RSA"
  rsa_bits    = 4096
}

# Create a local file for the private key
resource "local_file" "private_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "key.pem"
}

# Fetch the latest Ubuntu AMI using a data source
data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners = ["099720109477"]  # Canonical's AWS account ID for Ubuntu AMIs

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


# Create an EC2 instance
resource "aws_instance" "main" {
  count         = var.instance_count
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = var.instance_type
  key_name      = var.keypair_name
  subnet_id     = var.subnet_ids[count.index]
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
  #!/bin/bash

  # Update the package lists
  sudo apt-get update -y

  # install apache 
  sudo apt-get install apache2 -y

  # Start and enable the apache service
  sudo systemctl enable apache2

  # Create a simple index page
  sudo bash -c 'echo THIS IS WEB SERVER > /var/www/html/index.html'

  # Start the apache service
  sudo systemctl start apache2

  # Install Ansible
  sudo apt-get install ansible -y

  # Install Docker
  sudo apt-get install docker.io -y

  # Start and enable the Docker service
  sudo systemctl start docker
  sudo systemctl enable docker

  # Add the user to the docker group to run Docker without sudo
  sudo usermod -aG docker ubuntu
  EOF 

  tags = {
    Name = "${var.environment}-instance-${count.index + 1}"
  }
}
