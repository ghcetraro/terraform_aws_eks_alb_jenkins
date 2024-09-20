#
output "jenkins_url" {
  value = "${var.hostName}-${local.dns.public_name}"
}