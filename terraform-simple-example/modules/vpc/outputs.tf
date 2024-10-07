output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_id" {
  value = [for subnet in aws_subnet.public_subnet : subnet.id]
}

output "private_subnet_id" {
  value = [for subnet in aws_subnet.private_subnet : subnet.id]
}

output "lb_tg_arn" {
  value = aws_lb_target_group.this.arn
}

