output "id" {
  value       = aws_s3_object.this.id
  description = "The bucket name and object key separated by a slash (/)."
}

output "key" {
  value       = aws_s3_object.this.key
  description = "The key of the object within the bucket."
}

output "arn" {
  value       = aws_s3_object.this.arn
  description = "ARN of the object."
}

output "checksum_crc32" {
  value       = aws_s3_object.this.checksum_crc32
  description = "The base64-encoded, 32-bit CRC32 checksum of the object."
}

output "checksum_crc32c" {
  value       = aws_s3_object.this.checksum_crc32c
  description = "The base64-encoded, 32-bit CRC32C checksum of the object."
}

output "checksum_crc64nvme" {
  value       = aws_s3_object.this.checksum_crc64nvme
  description = "Base64-encoded, 64-bit CRC64NVME checksum of the object."
}

output "checksum_sha1" {
  value       = aws_s3_object.this.checksum_sha1
  description = "The base64-encoded, 160-bit SHA-1 digest of the object."
}

output "checksum_sha256" {
  value       = aws_s3_object.this.checksum_sha256
  description = "The base64-encoded, 256-bit SHA-256 digest of the object."
}

output "etag" {
  value       = aws_s3_object.this.etag
  description = "ETag generated for the object (an MD5 sum of the object content). For plaintext objects or objects encrypted with an AWS-managed key, the hash is an MD5 digest of the object data. For objects encrypted with a KMS key or objects created by either the Multipart Upload or Part Copy operation, the hash is not an MD5 digest, regardless of the method of encryption. More information on possible values can be found on Common Response Headers."
}

output "tags_all" {
  value       = aws_s3_object.this.tags_all
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "version_id" {
  value       = aws_s3_object.this.version_id
  description = "Unique version ID value for the object, if bucket versioning is enabled."
}
