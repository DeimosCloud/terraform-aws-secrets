variable "name" {
  description = "(Required) Specifies the friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters: /_+=.@-"
}

variable "value" {
  description = "(Required) Specifies text data that you want to encrypt and store in this version of the secret."
}

variable "tags" {
  default     = {}
  description = " (Optional) The labels assigned to this Secret"
}
