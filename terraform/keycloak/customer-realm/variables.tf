variable "keycloak_server_url" {
  type = string
  default = "http://keycloak.keycloak:80"
}

variable "terraform_client_id" {
  type = string
  nullable = false
  description = "The client id terraform provider for keycloak will use"
}
variable "terraform_client_secret" {
  type      = string
  sensitive = true
  nullable = false
  description = "The client secret terraform provider for keycloak will use"
}
variable "terraform_client_realm" {
  type    = string
  default = "master"
  description = "The realm in keycloak where the client is present"
}

variable "customer_realm_id" {
  type    = string
  description = "unique id of th customer realm"
  nullable = false
}

variable "customer_realm_name" {
  type    = string
  description = "Display name of the realm"
  nullable = false
}

variable "customer_realm_theme" {
  type    = string
  description = "Theme name to apply to customer realm"
  default = "base"
  nullable = false
}

variable "customer_realm_client_root_url" {
  type    = string
  description = "Root url to set in realm clients e.g. for browsers"
  nullable = false
}

variable "customer_realm_backend_client_id" {
  type    = string
  description = "Id for the backend client in the realm"
  nullable = false
}
variable "customer_realm_backend_client_secret" {
  type    = string
  description = "Secret for the backend client in the realm"
  nullable = false
  sensitive = true
}