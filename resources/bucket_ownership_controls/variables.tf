variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required) Name of the bucket that you want to associate this access point with."
}

variable "rule" {
  type = object({
    object_ownership = string
    # (Required) Object ownership. Valid values: BucketOwnerPreferred, ObjectWriter or BucketOwnerEnforced
    # BucketOwnerPreferred - Objects uploaded to the bucket change ownership to the bucket owner if the objects are uploaded with the bucket-owner-full-control canned ACL.
    # ObjectWriter - Uploading account will own the object if the object is uploaded with the bucket-owner-full-control canned ACL.
    # BucketOwnerEnforced - Bucket owner automatically owns and has full control over every object in the bucket. ACLs no longer affect permissions to data in the S3 bucket.
  })
  description = "(Required) Configuration block(s) with Ownership Controls rules."
}
