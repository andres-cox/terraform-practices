resource "aws_key_pair" "aws_key_demo" {
  key_name   = "${terraform.workspace}-${var.aws_key_name}"
  public_key = file(var.ssh_public_key_path)
}

resource "aws_instance" "instance_example_1" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  tags = {
    Name = "${terraform.workspace}-${var.instance_name_1}"
  }

  key_name = aws_key_pair.aws_key_demo.key_name
}

resource "aws_instance" "instance_example_2" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  tags = {
    Name = "${terraform.workspace}-${var.instance_name_2}"
  }

  provisioner "local-exec" {
    command    = "echo The IP address of the Server is ${self.private_ip}"
    on_failure = continue
  }

  key_name = aws_key_pair.aws_key_demo.key_name
}

module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "${terraform.workspace}-${var.website_s3_bucket_1_name}"

  tags = {
    Terraform   = var.terraform
    Environment = var.environment
  }
}

module "website_s3_bucket_2" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "${terraform.workspace}-${var.website_s3_bucket_2_name}"

  tags = {
    Terraform   = var.terraform
    Environment = var.environment
  }
}