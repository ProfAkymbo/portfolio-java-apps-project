terraform {
  backend "s3" {
    bucket         = "ak-backend-tf-bucket"
    key            = "app-cicd/terraform.tfstate"
    region         = "us-east-1"
    #dynamodb_table = "terraform-locking"
    use_lockfile   = true
  }
}
