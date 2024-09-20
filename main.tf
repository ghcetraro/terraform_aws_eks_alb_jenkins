resource "kubernetes_namespace" "jenkins" {
  metadata {
    annotations = {}
    labels      = {}
    name        = local.namespaces
  }
}
#
# https://artifacthub.io/packages/helm/jenkinsci/jenkins
#
resource "helm_release" "jenkins" {
  name         = "jenkins"
  namespace    = kubernetes_namespace.jenkins.metadata[0].name
  repository   = var.custom_helm_charts_repo
  chart        = "jenkins"
  version      = var.helm_chart_versions.jenkins
  reset_values = true
  wait         = false
  values = [
    templatefile("${path.module}/manifests/jenkins_server.tpl.yml", {
      acm_arn             = local.acm_certificate_arn_public,
      group_name          = local.app_name_dashed
      hostName            = "${var.hostName}.${local.dns.public_name}",
      imagePullSecretName = var.jenkins.registry_secret,
      pvc                 = local.pvc.name,
    })
  ]
  #
  depends_on = [
    kubernetes_namespace.jenkins,
    module.kubernetes_secret,
    kubernetes_persistent_volume_claim.jenkins
  ]
}
#
### Wait for jenkins ingress
resource "time_sleep" "wait_30_seconds" {
  depends_on = [
    helm_release.jenkins
  ]
  create_duration = "180s"
}