output "instance_id" {
  description = "The ID of the instance-1"
  value       = try(aws_instance.instance_example.id)
}