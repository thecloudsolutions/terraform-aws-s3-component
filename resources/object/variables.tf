variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required) Name of the bucket to put the file in. Alternatively, an S3 access point ARN can be specified."
}

variable "key" {
  type        = string
  description = "(Required) Name of the object once it is in the bucket."
}

variable "acl" {
  type        = string
  default     = null
  description = "(Optional) Canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, bucket-owner-read, and bucket-owner-full-control. Defaults to private."
}

variable "bucket_key_enabled" {
  type        = bool
  default     = null
  description = "(Optional) Whether or not to use Amazon S3 Bucket Keys for SSE-KMS."
}

variable "cache_control" {
  type        = string
  default     = null
  description = "(Optional) Caching behavior along the request/reply chain Read w3c cache_control for further details."
}

variable "checksum_algorithm" {
  type        = string
  default     = null
  description = "(Optional) Indicates the algorithm used to create the checksum for the object. If a value is specified and the object is encrypted with KMS, you must have permission to use the kms:Decrypt action. Valid values: CRC32, CRC32C, SHA1, SHA256."
}

variable "content_base64" {
  type        = string
  default     = null
  description = "(Optional, conflicts with source and content) Base64-encoded data that will be decoded and uploaded as raw bytes for the object content. This allows safely uploading non-UTF8 binary data, but is recommended only for small content such as the result of the gzipbase64 function with small text strings. For larger objects, use source to stream the content from a disk file"
}

variable "content_disposition" {
  type        = string
  default     = null
  description = "(Optional) Presentational information for the object. Read w3c content_disposition for further information."
}

variable "content_encoding" {
  type        = string
  default     = null
  description = "(Optional) Content encodings that have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field. Read w3c content encoding for further information."
}

variable "content_language" {
  type        = string
  default     = null
  description = "(Optional) Language the content is in e.g., en-US or en-GB."
}

variable "content_type" {
  type        = string
  default     = null
  description = "(Optional) Standard MIME type describing the format of the object data, e.g., application/octet-stream. All Valid MIME Types are valid for this input."
}

variable "content" {
  type        = string
  default     = null
  description = "(Optional, conflicts with source and content_base64) Literal string value to use as the object content, which will be uploaded as UTF-8-encoded text."
}

variable "etag" {
  type        = string
  default     = null
  description = "(Optional) Triggers updates when the value changes. The only meaningful value is filemd5(path/to/file) (Terraform 0.11.12 or later) or {md5(file(path/to/file))} (Terraform 0.11.11 or earlier). This attribute is not compatible with KMS encryption, kms_key_id or server_side_encryption = aws:kms (see source_hash instead)."
}

variable "force_destroy" {
  type        = bool
  default     = null
  description = "(Optional) Whether to allow the object to be deleted by removing any legal hold on any object version. Default is false. This value should be set to true only if the bucket has S3 object lock enabled."
}

variable "kms_key_id" {
  type        = string
  default     = null
  description = "(Optional) ARN of the KMS Key to use for object encryption. If the S3 Bucket has server-side encryption enabled, that value will automatically be used. If referencing the aws_kms_key resource, use the arn attribute. If referencing the aws_kms_alias data source or resource, use the target_key_arn attribute. Terraform will only perform drift detection if a configuration value is provided."
}

variable "metadata" {
  type        = map(string)
  default     = null
  description = "(Optional) Map of keys/values to provision metadata (will be automatically prefixed by x-amz-meta-, note that only lowercase label are currently supported by the AWS Go API)."
}

variable "object_lock_legal_hold_status" {
  type        = string
  default     = null
  description = "(Optional) Legal hold status that you want to apply to the specified object. Valid values are ON and OFF."
}

variable "object_lock_mode" {
  type        = string
  default     = null
  description = "(Optional) Object lock retention mode that you want to apply to this object. Valid values are GOVERNANCE and COMPLIANCE."
}

variable "object_lock_retain_until_date" {
  type        = string
  default     = null
  description = "(Optional) Date and time, in RFC3339 format, when this object's object lock will expire."
}

variable "override_provider" {
  type = object({
    default_tags = optional(object({
      tags = optional(map(string))
      # (Optional) Empty map used to suppress provider-level default tags for this object.
    }))
  })
  default     = null
  description = "(Optional) Override provider-level configuration options."
}

variable "server_side_encryption" {
  type        = string
  default     = null
  description = "(Optional) Server-side encryption of the object in S3. Valid values are AES256 and aws:kms."
}

variable "source_hash" {
  type        = string
  default     = null
  description = "(Optional) Triggers updates like etag but useful to address etag encryption limitations. Set using filemd5(path/to/source) (Terraform 0.11.12 or later). (The value is only stored in state and not saved by AWS.)"
}

## Should be variable "source", but gives an error "The variable name "source" is reserved due to its special meaning inside module blocks.""
variable "source_to_file" {
  type        = string
  default     = null
  description = "(Optional, conflicts with content and content_base64) Path to a file that will be read and uploaded as raw bytes for the object content."
}

variable "storage_class" {
  type        = string
  default     = null
  description = "(Optional) Storage Class for the object. Defaults to STANDARD."
}

variable "website_redirect" {
  type        = string
  default     = null
  description = "(Optional) Target URL for website redirect."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A map of tags assigned to all modules."
}
