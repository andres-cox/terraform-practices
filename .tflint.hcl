config {
    module = true
    varfile = ["prod.tfvars","dev.tfvars"]
}

plugin "aws" {
    enabled = true
    version = "0.17.1"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}