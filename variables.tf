variable "parameter_root_name" {
  description = "The prefix or root parameter that you want to allow access to"
  default     = ""
}

variable "kms_key" {
  description = "The arn of the KMS key that you want to allow access to. If empty it uses a wildcard resource. `*` "
  default     = ""
}

variable "region" {
  description = "The region of the parameter store value that you want to allow access to. If none supplied, it uses the current region of the provider."
  default     = ""
}

variable "account_id" {
  description = "The account id of the parameter store you want to allow access to. If none supplied, it uses the current account id of the provider. "
  default     = ""
}
