resource "yandex_cm_certificate" "this" {
  name    = "${var.hack_name}-certificate"
  domains = [var.domain]

  managed {
    challenge_type = "DNS_CNAME"
  }
}
