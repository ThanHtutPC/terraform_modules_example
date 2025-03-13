# Launch an EC2 instance
resource "aws_instance" "example" {
  ami                         = "ami-0b03299ddb99998e9" # Amazon Linux 2 AMI (ap-southeast-1)
  instance_type               = "t2.micro"
  subnet_id                   = var.public_id
  vpc_security_group_ids      = [var.sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "example-instance"
  }
  provisioner "file" {
    source      = "script.sh"
    destination = "/home/ec2-user/script.sh"
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod a+x /home/ec2-user/script.sh",
      "/home/ec2-user/script.sh",
    ]
  }

  provisioner "local-exec" {
    command = "echo 'Instance created with IP: ${self.public_ip}' > instance_info.txt"
  }
}
