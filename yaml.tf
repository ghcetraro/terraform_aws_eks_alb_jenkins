#
data "kubectl_path_documents" "docs_roles" {
  pattern = "./roles/current/*.yaml"
}
#
resource "kubectl_manifest" "docs_roles" {
  for_each  = toset(data.kubectl_path_documents.docs_roles.documents)
  yaml_body = each.value
  #
  depends_on = [
    kubernetes_namespace.jenkins,
  ]
}

