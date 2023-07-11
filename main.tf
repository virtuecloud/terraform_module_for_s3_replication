module "bucket-replication" {
    # source = "git::https://github.com/sahilj713/s3_replication_same_and_cross_region.git//s3-bucket"
    source = "./s3-bucket"
    iam_role_name = "tf-iam-role-replication-1234567"
    iam_policy_name = "tf-iam-role-policy-replication-1234567"
    source-region = "us-east-1"
    destination-region = "us-east-1"
    source-bucket = "tf-test-bucket-source-123456789"
    destination-bucket = "tf-test-bucket-destinations-1234567890"
    storage-class = "STANDARD"
}