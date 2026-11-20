variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required, Forces new resource) Name of the bucket."
}

variable "expected_bucket_owner" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Account ID of the expected bucket owner."
}

variable "cors_rule" {
  type = set(object({
    allowed_headers = optional(set(string))
    # (Optional) Set of Headers that are specified in the Access-Control-Request-Headers header. 
    allowed_methods = set(string)
    # (Required) Set of HTTP methods that you allow the origin to execute. Valid values are GET, PUT, HEAD, POST, and DELETE.
    allowed_origins = set(string)
    # (Required) Set of origins you want customers to be able to access the bucket from.
    expose_headers = optional(set(string))
    # (Optional) Set of headers in the response that you want customers to be able to access from their applications (for example, from a JavaScript XMLHttpRequest object).
    id = optional(string)
    # (Optional) Unique identifier for the rule. The value cannot be longer than 255 characters.
    max_age_seconds = optional(number)
    # (Optional) Time in seconds that your browser is to cache the preflight response for the specified resource.
  }))

  description = "(Required) Set of origins and methods (cross-origin access that you want to allow). You can configure up to 100 rules."
}
