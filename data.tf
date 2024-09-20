#
data "aws_caller_identity" "current" {}
#
data "kubernetes_ingress_v1" "jenkins" {
  metadata {
    name      = "jenkins"
    namespace = "jenkins"
  }
  depends_on = [
    helm_release.jenkins
  ]
}
#