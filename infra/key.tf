resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "${local.environment}-key"
  public_key = tls_private_key.example.public_key_openssh
}

resource "local_file" "public-key" {
    content     = tls_private_key.example.public_key_openssh
    filename = "${local.environment}-key.pub"
}

resource "local_file" "private-key" {
    content     = tls_private_key.example.private_key_pem
    filename = "${local.environment}-key.pem"
}