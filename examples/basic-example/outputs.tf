output "this_instance_id" {
  description = "The id of the ots instance"
  value       = module.ots.this_instance_id
}

output "this_instance_name" {
  description = "The name of the ots instance"
  value       = module.ots.this_instance_name
}

output "this_vpc_name" {
  description = "The vpc name of the ots instance attached."
  value       = module.ots.this_instance_name
}

output "this_vswitch_id" {
  description = "The vswitch id of the ots instance attached."
  value       = module.ots.this_instance_name
}

output "this_table_name" {
  description = "The name of the ots table"
  value       = module.ots.this_instance_name
}