output "instance_1_id" {
  description = "The ID of the instance-1"
  value       = try(aws_instance.instance_example_1.id)
}

output "instance_2_id" {
  description = "The ID of the instance-2"
  value       = try(aws_instance.instance_example_2.id)
}
