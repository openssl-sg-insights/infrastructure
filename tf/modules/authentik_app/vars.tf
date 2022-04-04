terraform {
  experiments = [module_variable_optional_attrs]
}

variable "name" {
  type = string
}

variable "group" {
  type = string
}

variable "internal" {
  type = string
}

variable "external" {
  type = string
}

variable "icon_url" {
  type    = string
  default = null
}

variable "skip_path_regex" {
  type    = string
  default = null
}

variable "access_group" {
  type = list(string)
}

output "app_id" {
  value = authentik_application.app.id
}

output "provider_id" {
  value = authentik_provider_proxy.provider.id
}
