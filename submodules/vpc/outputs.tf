# outputs for public_id
output "public_id" {
    value = aws_subnet.public.id
}

# outputs for security_group_id
output "sg_id" {
    value = aws_security_group.ssh.id
}