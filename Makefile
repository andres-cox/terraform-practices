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

console:
	terraform console

validate:
	terraform validate

list-instances:
	aws ec2 describe-instances --query "Reservations[].Instances[].InstanceId"

copy-files-s3:
# aws s3 cp modules/aws-s3-static-website-bucket/www/ s3://$(terraform output -raw s3_bucket_domain)/ --recursive
	aws s3 cp modules/aws-s3-static-website-bucket/www/ s3://clickittech-terraform-best-practices/ --recursive

delete-files-s3:
# aws s3 rm s3://$(terraform output -raw s3_bucket_domain)/ --recursive
	aws s3 rm s3://clickittech-terraform-best-practices/ --recursive

# TERRAFORM DOCS
create-readme:
	terraform-docs markdown table --output-file README.md --output-mode replace modules/aws-s3-static-website-bucket/

# WORKSPACES
create-workspaces:
	terraform workspace new dev
	terraform workspace new prod

list-workspace:
	terraform workspace list

show-workspace:
	terraform workspace show

select-dev:
	terraform workspace select dev

select-prod:
	terraform workspace select prod

plan-dev:
	terraform plan --var-file="dev.tfvars"

apply-dev:
	terraform apply --var-file="dev.tfvars" -auto-approve

destroy-dev:
	terraform destroy --var-file="dev.tfvars" -auto-approve

plan-prod:
	terraform plan --var-file="prod.tfvars" -auto-approve

apply-prod:
	terraform apply --var-file="prod.tfvars" -auto-approve

destroy-prod:
	terraform destroy --var-file="prod.tfvars" -auto-approve
