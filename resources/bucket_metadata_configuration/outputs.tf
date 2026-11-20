output "table_bucket_arn" {
  value       = aws_s3_bucket_metadata_configuration.this.metadata_configuration[0].destination[0].table_bucket_arn
  description = "The ARN of the table bucket storing the metadata tables."
}

output "table_bucket_type" {
  value       = aws_s3_bucket_metadata_configuration.this.metadata_configuration[0].destination[0].table_bucket_type
  description = "The type of the table bucket storing the metadata tables."
}

output "table_namespace" {
  value       = aws_s3_bucket_metadata_configuration.this.metadata_configuration[0].destination[0].table_namespace
  description = "The namespace storing the metadata tables."
}

output "inventory_table_arn" {
  value       = aws_s3_bucket_metadata_configuration.this.metadata_configuration[0].inventory_table_configuration[0].table_arn
  description = "The ARN of the inventory table."
}

output "inventory_table_name" {
  value       = aws_s3_bucket_metadata_configuration.this.metadata_configuration[0].inventory_table_configuration[0].table_name
  description = "The name of the inventory table."
}

output "journal_table_arn" {
  value       = aws_s3_bucket_metadata_configuration.this.metadata_configuration[0].journal_table_configuration[0].table_arn
  description = "The ARN of the journal table."
}

output "journal_table_name" {
  value       = aws_s3_bucket_metadata_configuration.this.metadata_configuration[0].journal_table_configuration[0].table_name
  description = "The name of the journal table."
}
