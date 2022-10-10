format-check:
	terraform fmt -check

format:
	terraform fmt -diff

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply -auto-approve

destroy:
	terraform destroy -auto-approve

list-instances:
	aws ec2 describe-instances --query "Reservations[].Instances[].InstanceId"

copy-files-s3:
# aws s3 cp modules/aws-s3-static-website-bucket/www/ s3://$(terraform output -raw s3_bucket_domain)/ --recursive
	aws s3 cp modules/aws-s3-static-website-bucket/www/ s3://clickittech-terraform-best-practices/ --recursive

delete-files-s3:
# aws s3 rm s3://$(terraform output -raw s3_bucket_domain)/ --recursive
	aws s3 rm s3://clickittech-terraform-best-practices/ --recursive