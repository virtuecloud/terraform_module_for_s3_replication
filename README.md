<h1 align="center"> Virtuecloud </h1> <br>
<p align="center">
  <a href="https://virtuecloud.io/">
    <img alt="Virtuecloud" title="Virtuecloud" src="https://virtuecloud.io/assets/images/VitueCloud_Logo.png" width="450">
  </a>
</p>

# S3 bucket with Cross-Region Replication (CRR) enabled

Configuration in this directory creates S3 bucket in one region and configures CRR to another bucket in another region. User can define the source and the destination regions 

<!-- Please check [complete example](https://github.com/terraform-aws-modules/terraform-aws-s3-bucket/tree/master/examples/complete) to see all other features supported by this module. -->

# Core Components

## AWS

_The AWS infrastructure is setup using terraform in the ./terraform._

_The following components are used:_

1. IAM ROLE 
2. IAM POLICY 
3. S3 BUCKETS


## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.9 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_replica_bucket"></a> [bucket\-replication](#module\_replica\_bucket) | ./s3-bucket | n/a |

```hcl
module "bucket-replication" {
    source = "./s3-bucket"
    iam_role_name = "tf-iam-role-replication-1234567"
    iam_policy_name = "tf-iam-role-policy-replication-1234567"
    source-region = "us-east-1"
    destination-region = "us-east-2"
    source-bucket = "tf-test-bucket-source-123456789"
    destination-bucket = "tf-test-bucket-destinations-123456789"
    storage-class = "STANDARD"
}

```

## Inputs

|Name              |Description                                          |Type   |Default|
|------------------|-----------------------                              |-------|-------|
|iam_role_name     |name of your role                                    |string |       |
|iam_policy_name   |name of your policy                                  |string |       |
|source-bucket     |Name of your source bucket                           |string |       |
|destination-bucket|Name of the service                                  |string |       |
|source-region     |Region of your source bucket                         |string |       |
|destination-region|Region of your destination bucket                    |string |       |
|storage-class     |specifies the storage_class of the destination bucket|string |standard|
