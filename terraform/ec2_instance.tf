
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "jenkins_key"
  public_key = file("id_ed25519.pub")
}

resource "aws_instance" "test" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  tags = {
    Name = "test_server"
  }
  user_data = file("test.sh")
  key_name = "ap-south"
}

resource "aws_instance" "prod" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  tags = {
    Name = "prod_server"
  }
  user_data = file("prod.sh")
  //key_name = aws_key_pair.ssh_key.key_name
  key_name = "ap-south"
}