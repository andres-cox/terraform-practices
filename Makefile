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
