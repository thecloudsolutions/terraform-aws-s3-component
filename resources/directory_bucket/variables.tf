variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required, Forces new resource) Name of the directory bucket in the format [bucket_name]--[zone_id]--x-s3."
}

variable "data_redundancy" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Data redundancy. Valid values are SingleAvailabilityZone and SingleLocalZone. Defaults based on location.type."
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "(Optional) Whether to delete all objects when destroying the bucket. These objects are not recoverable. This value must be applied before destroying the bucket."
}

variable "location" {
  type = object({
    name = string
    # (Required, Forces new resource) Availability Zone ID or Local Zone ID.
    type = optional(string)
    # (Optional, Forces new resource) Location type. Valid values are AvailabilityZone and LocalZone. Defaults to AvailabilityZone.
  })
  description = "(Required, Forces new resource) Location of the directory bucket."
}

variable "type" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Bucket type. The only valid value is Directory."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A map of tags assigned to the bucket."
}
