# Uso y despliegue

## Descripción

Jenkins en EKS con ALB Ingress, PVC, DNS/ACM y métricas Prometheus — Terraform

Stack Terraform que despliega Jenkins en EKS con ALB Ingress Controller, PVC (EFS), DNS/ACM, rol admin y scraping Prometheus.

## Requisitos

- Terraform 1.x
- AWS CLI con permisos adecuados
- Para módulos EKS: cluster existente y acceso de API

## Variables

Usá siempre la plantilla **`terraform.tfvars.example`**. No subas `terraform.tfvars` ni el state.

### Módulo raíz del repo

```bash
# desde la raíz
cp terraform.tfvars.example terraform.tfvars
# Completar variables y locals según tu cuenta/cluster

aws sso login --profile <tu-profile>   # o credenciales equivalentes
terraform init
terraform plan
terraform apply
```


## Post-apply

Revisá outputs del módulo y recursos en la consola AWS / `kubectl` según corresponda.

## Seguridad

Ver [SECURITY.md](../SECURITY.md).
