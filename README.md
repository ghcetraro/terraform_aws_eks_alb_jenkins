# Jenkins en EKS + ALB Ingress

[![License: MIT](https://img.shields.io/github/license/ghcetraro/terraform_aws_eks_alb_jenkins)](LICENSE)
[![Terraform](https://img.shields.io/badge/terraform-1.x-7B42BC.svg)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-compatible-FF9900.svg)](https://aws.amazon.com/)
[![CI](https://github.com/ghcetraro/terraform_aws_eks_alb_jenkins/actions/workflows/ci.yml/badge.svg)](https://github.com/ghcetraro/terraform_aws_eks_alb_jenkins/actions/workflows/ci.yml)

**Jenkins en EKS con ALB Ingress, PVC, DNS/ACM y métricas Prometheus — Terraform**

---

## El problema

Instalar Jenkins en EKS con ingress seguro, storage persistente y métricas suele ser un puzzle de charts y roles IAM.

## La solución

Stack Terraform que despliega Jenkins en EKS con ALB Ingress Controller, PVC (EFS), DNS/ACM, rol admin y scraping Prometheus.

```mermaid
flowchart LR
  U[Usuarios] --> ALB[ALB]
  ALB --> J[Jenkins en EKS]
  J --> PVC[(PVC/EFS)]
  J --> PROM[Prometheus]
  TF[Terraform] --> J
  TF --> ALB
```

---

## Características

| Área | Detalle |
|------|---------|
| **Jenkins** | Despliegue en EKS listo para CI |
| **ALB Ingress** | Exposición HTTPS con ACM |
| **Persistencia** | PVC / EFS para datos de Jenkins |
| **Observabilidad** | Métricas Prometheus |
| **IAM** | Rol admin para operaciones en el cluster |

---

## Limitaciones y disclaimer

- Pensado como **punto de partida / referencia**: revisá roles IAM, redes y secretos antes de producción.
- Requiere **credenciales AWS** (recomendado SSO) y, en módulos EKS, acceso al cluster (kubeconfig / exec).
- Completá `locals` y variables según tu cuenta; los ejemplos usan valores ficticios.
- Software open source “as is” — probá primero en un ambiente no productivo.

---

## Stack

Terraform · EKS · Jenkins · AWS Load Balancer Controller · ACM · Prometheus

---

## Inicio rápido

### Requisitos

- Terraform CLI 1.x
- AWS CLI configurado (`aws sso login` o credenciales)
- Permisos de administración en la cuenta / cluster según el módulo

### Configuración

```bash
# En cada módulo: copiá la plantilla (no commitear terraform.tfvars)
cp terraform.tfvars.example terraform.tfvars
```

Valores de ejemplo: `terraform.tfvars.example`

### Apply

```bash
cp terraform.tfvars.example terraform.tfvars
# Editar valores (cuenta, región, cluster, etc.)

terraform init
terraform plan
terraform apply
```

---

## Documentación

- [Uso y despliegue](docs/uso.md)
- [Presentación / LinkedIn](docs/PRESENTACION.md)
- [Speech para LinkedIn](docs/speech-linkedin.md)
- [Changelog](CHANGELOG.md)
- [Contribuir](CONTRIBUTING.md)
- [Seguridad](SECURITY.md)

---

## Seguridad

**No commitees** `terraform.tfvars`, state, claves ni tokens. Usá `*.tfvars.example` como plantilla.

Ver [SECURITY.md](SECURITY.md).

---

## Licencia

[MIT](LICENSE) — Copyright (c) Gabriel Cetraro

---

## Autor

Proyecto open source de **Gabriel Cetraro** — automatización de infraestructura, AWS, Kubernetes y observabilidad.

Si te resulta útil, ⭐ en GitHub ayuda a darle visibilidad.
