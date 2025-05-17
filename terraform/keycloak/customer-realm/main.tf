resource "keycloak_realm" "customer_realm" {
  realm             = var.customer_realm_id
  enabled           = true
  display_name      = var.customer_realm_name
  display_name_html = "${var.customer_realm_name}"

  login_theme = var.customer_realm_theme
  registration_allowed = false

  access_code_lifespan = "1h"

  duplicate_emails_allowed = false
  verify_email= true

  ssl_required    = "external"
  password_policy = "upperCase(1) and length(12) and notUsername"
  attributes      = {
    mycustomAttribute = "myCustomValue"
  }

  internationalization {
    supported_locales = [
      "en",
      "de",
      "es"
    ]
    default_locale    = "en"
  }

  security_defenses {
    headers {
      x_frame_options                     = "DENY"
      content_security_policy             = "frame-src 'self'; frame-ancestors 'self'; object-src 'none';"
      content_security_policy_report_only = ""
      x_content_type_options              = "nosniff"
      x_robots_tag                        = "none"
      x_xss_protection                    = "1; mode=block"
      strict_transport_security           = "max-age=31536000; includeSubDomains"
    }
    brute_force_detection {
      permanent_lockout                 = false
      max_login_failures                = 30
      wait_increment_seconds            = 60
      quick_login_check_milli_seconds   = 1000
      minimum_quick_login_wait_seconds  = 60
      max_failure_wait_seconds          = 900
      failure_reset_time_seconds        = 43200
    }
  }
}