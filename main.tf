resource "aws_instance" "instance_example_1" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name_1
  }
}

resource "aws_instance" "instance_example_2" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name_2
  }

  provisioner "local-exec" {
    command    = "echo The IP address of the Server is ${self.private_ip}"
    on_failure = continue
  }
}

module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "clickittech-terraform-best-practices"

  tags = {
    Terraform   = "true"
    Environment = "test"
  }
}

module "website_s3_bucket_2" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "clickittech-terraform-best-practices-2"

  tags = {
    Terraform   = "true"
    Environment = "test"
  }
}