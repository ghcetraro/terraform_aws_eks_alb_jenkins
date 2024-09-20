# README

This repository is used to install :
	
	.- jenkins in eks 
	.- alb controller ingress 
	.- jenkins admin eks role
	.- jenkins prometheus metrics
	
	on aws with terraform

## Locals

	The missing information of the external components required needs to be completed
```
    storage_class_name = " " # to fill 
    efs_driver         = " " # to fill 
    efs_id             = " " # to fill 

    public_zone_id = " " # to fill 
    public_name    = " " # to fill 

    acm_certificate_arn_public = " " # to fill 

    endpoint                   = " " # to fill 
    certificate_authority_data = " " # to fill 
    id                         = " " # to fill 
    oidc_provider              = " " # to fill 
    oidc_provider_arn          = " " # to fill 
    oidc_issuer_url            = " " # to fill 
```

## Configuration with aws sso

  - You need to create/configure your parameters in the following file  
```
    terraform.tfvars
```

  - You need to create your profile in your .aws/config and .aws/credentials

.aws/config  
```
	[profile devops]
	sso_start_url=<url>
	sso_region=<region>
	sso_account_id=<account id>
	sso_role_name=<role name>
	region=<defaul region>
	output=json
```

  - Run to obtain the credentials

  	aws sso login --profile devops

### *Terraform Individual Variables*

```
customer       = "devops"
environment    = "production"
region         = "us-east-1"
#
hostName = "jenkins"
```

## Running

To run the following scripts, you will need to have ADMIN privileges.

  Following 3 commands need to be executed for every deployment
``` 
  terraform init 
  terraform plan 
  terraform apply 
```

## Pre-requisites

- Terraform CLI is [installed](https://learn.hashicorp.com/tutorials/terraform/install-cli).  
- AWS CLI [installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).  

## Terraform Scripts
``` 
data.tf
dns.tf
locals.tf
main.tf
manifests
output.tf
providers.tf
pvc.tf
variables.tf
yaml.tf

``` 

## Resources

Resources that are going to be deployed  
```
	AWS  
		eks
		storage  
		roles  
		polices  
		targets
		security groups  
		load balancer

	EKS
		secrets
		configmap
		service account
		role
		role attachment
		ingress
```

## Dependencies
	
	VPC
	EKS
	ACM
	Load Balancer
	Route53

