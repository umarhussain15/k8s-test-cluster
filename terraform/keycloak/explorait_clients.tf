resource "keycloak_openid_client" "customer_frontend" {
  realm_id            = keycloak_realm.customer_realm.id
  client_id           = "customer-frontend"

  name                = "Frontend"
  enabled             = true

  access_type         = "PUBLIC"
  standard_flow_enabled = true
  direct_access_grants_enabled = true

  web_origins = [
    "+"
  ]
  root_url = "http://localhost:8000/"
  valid_redirect_uris = [
    "http://localhost:8000/openid-callback"
  ]
  valid_post_logout_redirect_uris = [
    "http://localhost:8000/",
    "http://localhost:8000/logoutComplete"
  ]
}

resource "keycloak_openid_client" "customer_backend" {
  realm_id            = keycloak_realm.customer_realm.id
  client_id           = "customer-backend"
# We can set it via secret variable or keycloak will generate it if missing, but then it needs to be retrieved from keycloak UI
#   client_secret = var.customer_explorait_secret
  name                = "Backend"
  enabled             = true
  
  access_type         = "CONFIDENTIAL"
  standard_flow_enabled = true
  direct_access_grants_enabled = true
  service_accounts_enabled = true

  web_origins = [
    "+"
  ]
  valid_redirect_uris = [
    "http://localhost:8000/openid-callback"
  ]
  valid_post_logout_redirect_uris = [
    "http://localhost:8000/",
    "http://localhost:8000/logoutComplete"
  ]

}