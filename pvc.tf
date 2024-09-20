#
resource "kubernetes_persistent_volume_claim" "jenkins" {
  metadata {
    name      = local.pvc.name
    namespace = kubernetes_namespace.jenkins.metadata[0].name
  }
  spec {
    access_modes       = ["ReadWriteMany"]
    storage_class_name = local.pvc.storage_class_name
    resources {
      requests = {
        storage = local.pvc.storage
      }
    }
  }
  #
  depends_on = [
    kubernetes_namespace.jenkins,
  ]
}