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