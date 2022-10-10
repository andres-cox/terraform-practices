terraform {
  backend "s3" {
    bucket         = "terraform-best-practices"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_locks" # To lock remote state
  }
}