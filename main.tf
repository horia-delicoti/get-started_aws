resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.ubuntu_ami.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = var.instance_name
  }

  # cloudinit(provider) and s3
  # https://developer.hashicorp.com/terraform/language/resources/provisioners/connection
  # Provision file with connection block source and destination
  provisioner "file" {
    source      = "files/hello-world.txt"
    destination = "/home/ubuntu/hello-world.txt"

    # Connection is necessary for file provisioner to work
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("aws_id_rsa")
      timeout     = "4m"
    }
  }
}

# Setting Security Group for ssh access
resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]

  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
}

#Resource to Create Key Pair
resource "aws_key_pair" "generated_key" {
  key_name   = var.aws_key_pair_name
  public_key = file("aws_id_rsa.pub")
}
