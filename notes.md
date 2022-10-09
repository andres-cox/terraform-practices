## Practice 1: Host Terraform Code in the Git Repository

## Practice 2: Use .gitignore to Exclude Terraform State Files, State Directory Backups, and Core Dumps

## Practice 3: Use a Consistent File Structure

- Use folders in your project structure when using modules. Modules are folders that contain config files that have been created in a way that allows for the code to be reused. 
- A README.md file should be included in each repository. 
- Create main.tf to call modules, store locals, and data sources to create all the required resources.
- It’s a good idea to have a provider.tf with provider details. 
- Have a variables.tf file where you can store declarations of variables used in main.tf and outputs.tf should contain outputs. 
- Use terraform.tfvars to automatically load a number of variable definitions.

## Practice 4: Auto Format Terraform Files
Always use ‘terraform fmt -diff’ to check and format your Terraform configuration files before you commit and push them.
    terraform fmt -check
    tterraform fmt or terraform fmt -diff

## Practice 5: Avoid Hard Coding Resources
Avoid the following and use variables.tf instead

resource “aws_instance” “my_example” {
  ami           = “ami-005de95e8ff495156”
  instance_type = “t2.micro”
  tags = {
    Name = “instance-1”
  }
}

## Practice 6: Follow Naming Convention
Set certain standards or norms within your team for naming resources and follow them at all times.  

- Instead of – (dash), use _ (underscore) everywhere (in resource names, data source names, variable names, outputs, etc.).
- Use lowercase letters and numbers whenever possible.
- When it comes to names, single nouns should always be used.
- Use -(dash) inside arguments and in locations where the value will be visible to a human (e.g.:, name of EC2 instance, name of RDS instance).

## Practice 7: Use the self variable

Use ‘self’ variable when you don’t know the value of the variable before deploying an infrastructure.

A self variable is a type of value that is unique to your resources and populated at the time of creation. This type of variable is utilized when the value of a variable is unknown prior to deploying infrastructure.

## Practice 8: Use Modules
Always use modules. This will save you a lot of coding time. There’s really no need to reinvent the wheel. 

A module is a container for a collection of related resources. Modules can be used to construct lightweight abstractions allowing your infrastructure to be described in terms of its architecture rather than in terms of its physical objects. You can put your code within a Terraform module and reuse it numerous times throughout the life span of your Terraform project.

Every Terraform practitioner should employ modules in accordance with the following guidelines:

Begin writing your setup.
Organize and encapsulate your code using local modules.
Find relevant modules by searching the public Terraform Registry.
Share modules with your team after they’ve been published.