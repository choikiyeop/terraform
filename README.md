# terraform

IaC(Infrastructure as Code)는 코드를 통해 인프라를 관리하는 것을 말한다.
IaC툴로서 Redhat Ansible, AWS CloudFormation, Chef, Puppet등이 있는데 이 레포지토리는 Terraform의 코드를 다룬다.

## 실행

```
terraform init
```

provider에 맞는 플러그인 다운 및 초기화

```
terraform plan
```

코드와 현재 인프라 상태를 비교하여 생성/변경/삭제할 사항들을 나열

```
terraform apply
```

변경사항을 인프라에 적용

## 개념

- provider: AWS, GCP, Azure와 같은 클라우드 공급자
- resource: 실제로 생성할 인프라 자원
- module: 공통적으로 활용할 수 있는 인프라 코드를 한 곳으로 모아서 정의
- backend: terraform의 상태를 저장할 공간을 지정
- output: 인프라를 프로비저닝한 후에 생성된 자원을 output으로 추출
- remote state: VPC, IAM 등과 같은 공용서비스를 다른 서비스에서 참조 가능. tfstate 파일이 저장되어 있는 backend 정보를 명시하면 terraform이 해당 backend에서 output정보들을 가져온다.

## 폴더 구조

```
terraform
└─ aws
   ├─ modules
   │  ├─ eks
   │  ├─ iam
   │  ├─ rds
   │  ├─ s3
   │  └─ vpc
   ├─ data.tf
   ├─ main.tf
   ├─ provider.tf
   ├─ terraform.tfvars
   └─ variable.tf
```

## 참고

[aws module 주소](https://registry.terraform.io/namespaces/terraform-aws-modules)  

[aws document 주소](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)  

[github terraform-aws-eks 모듈 주소](https://github.com/terraform-aws-modules/terraform-aws-eks)

[깃허브 terraform-helm-provider 주소](https://github.com/hashicorp/terraform-provider-helm)  

[aws-load-balancer-controller](https://kubernetes-sigs.github.io/aws-load-balancer-controller)
