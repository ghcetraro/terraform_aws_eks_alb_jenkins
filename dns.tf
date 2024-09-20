# Public Wildcards
resource "aws_route53_record" "alb" {
  zone_id = local.dns.public_zone_id
  name    = var.hostName
  type    = "CNAME"
  ttl     = "60"
  records = [data.kubernetes_ingress_v1.jenkins.status.0.load_balancer.0.ingress.0.hostname]
  depends_on = [
    helm_release.jenkins,
    time_sleep.wait_30_seconds
  ]
}
#
