terraform {
  required_providers {
    keycloak = {
      source = "keycloak/keycloak"
      version = "5.2.0"
    }
  }
}

variable "client_id" {
  type = string
}
variable "client_secret" {
  type      = string
  sensitive = true
}
variable "realm" {
  type    = string
  default = "master"
}
provider "keycloak" {
  client_id     = var.client_id
  client_secret = var.client_secret
  url           = "http://keycloak.keycloak:80"
  realm         = var.realm
}
