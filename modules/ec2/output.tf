output "ec2_id" {
  value = aws_instance.jump_host.id
}

output "instance_ids" {
  value = data.aws_instances.all_instances.ids
}