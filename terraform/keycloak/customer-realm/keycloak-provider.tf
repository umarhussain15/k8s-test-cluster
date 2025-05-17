terraform {
  required_providers {
    keycloak = {
      source  = "keycloak/keycloak"
      version = "5.2.0"
    }
  }
}

provider "keycloak" {
  client_id     = var.terraform_client_id
  client_secret = var.terraform_client_secret
  url           = var.keycloak_server_url
  realm         = var.terraform_client_realm
}
