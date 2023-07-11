provider "aws" {
  region = var.source-region
  alias = "source"
}

provider "aws" {
  region = var.destination-region
}

resource "aws_s3_bucket" "destinations" {
  bucket = var.destination-bucket
  force_destroy = true
  lifecycle {
    prevent_destroy = false
  }

}



resource "aws_s3_bucket_versioning" "destination" {
  bucket = aws_s3_bucket.destinations.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "source" {
  provider = aws.source
  bucket   = var.source-bucket
  force_destroy = true
  lifecycle {
    prevent_destroy = false
  }
}


resource "aws_s3_bucket_versioning" "source" {
  provider = aws.source

  bucket = aws_s3_bucket.source.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_replication_configuration" "replication" {
  provider = aws.source
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.source]

  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.source.id

  rule {
    id = "foobar"

    filter {
      prefix = "foo"
    } 
    
    delete_marker_replication {
      status = "Disabled"
}

  

    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.destinations.arn
      storage_class = var.storage-class
    }
  }
}
