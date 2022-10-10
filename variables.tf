variable "instance_ami" {
  description = "Value of the AMI ID for the EC2 instance ubuntu-bionic-18.04"
  type        = string
  default     = "ami-005de95e8ff495156"
}

variable "instance_type" {
  description = "Value of the Instance Type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "instance_name_1" {
  description = "Value of the Name Tag for the EC2 instance"
  type        = string
  default     = "instance-1"
}

variable "instance_name_2" {
  description = "Value of the Name Tag for the EC2 instance"
  type        = string
  default     = "instance-2"
}

variable "website_s3_bucket_1_name" {
  description = "Value of the Name Tag for the S3 bucket"
  type        = string
}

variable "website_s3_bucket_2_name" {
  description = "Value of the Name Tag for the S3 bucket"
  type        = string
}

variable "terraform" {
  description = "Value of the Terraform Tag for the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Value of the Environment Tag for the S3 bucket"
  type        = string
}

variable "ssh_public_key_path" {
  description = "local path of id_rsa.pub"
  type        = string
}

variable "aws_key_name" {
  description = "aws key for instances"
  type        = string
  default     = "key-demo"
}