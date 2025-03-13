# Create a key pair for SSH access
resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-key"
  public_key = file("~/.ssh/id_rsa.pub") # Replace with the path to your public key
}
