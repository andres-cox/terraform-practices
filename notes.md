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

## Practice 9: Run Terraform Command with var-file
Maintain multiple .tfvars files with the definition of variables so that you can pass the required file with var-file flag to the ‘terraform plan’ or ‘terraform apply’ command.

Once you have one or more.tfvars files, you can use the -var-file flag to direct Terraform as to which file it should use to supply input variables to the Terraform command.

## Practice 10: Manage Terraform State on a Remote Storage
The state of Terraform is divided into two parts: remote state and state locking. Terraform saves state by default in a file called terraform.tfstate on your local machine. 
This does the job for personal projects, but when it comes to Terraform group projects, using a local file becomes complicated seeing as each user must ensure that they have the most recent state data before running Terraform and that no one else is running Terraform at the same time.

When you’re working on a project with multiple users, you should always use Terraform backends to save the state file in a shared remote store.

## Practice 11: Locking Remote State
When two or more users operate on the infrastructure at the same time, they may run into issues with resource creation seeing as there may arise a situation where another process is executed before the current state is completed.

In such a situation, if your backend supports it, Terraform will lock your state for any operations that potentially write state.

Always use state locking when using a remote backend to store your Terraform state.

## Practice 12: Backup State Files
The status of the infrastructure is kept in a file named terraform.tfstate.Terraform.tfstate.backup also contains a backup of the previous state.

If you’re using a remote backend like AWS S3 Bucket, versioning on the S3 bucket is highly encouraged. This way, your state file looks like it’s corrupted or in an incorrect state, and the bucket supports bucket versioning, you may be able to recover by restoring a previous version of the state file.

Always enable versioning on your remote backend storage in case you need to recover from unexpected failures.

## Practice 13: Manipulate Terraform State Through Terraform Commands Only
Modifying state data outside of a normal ‘terraform plan’ or ‘terraform apply’ operation may lead to Terraform losing track of controlled resources. In light of the foregoing, we recommend using the Terraform CLI, a more secure option, which provides commands for inspecting state, forcing re-creation, moving resources, and disaster recovery. [More Info](https://www.terraform.io/cli/state)

Always manipulate terraform state using terraform CLI and avoid making manual changes in the state file.

## Practice 14: Generate README for each Module with Input and Output Variables
There are several stages on the road to automation. Some are simpler than others and documentation is one of the least well-known stages. 

We will be diving into a terraform-docs utility which automatically generates a README.md so that you can avoid having to manually write it for input variables and outputs. Click [here](https://github.com/terraform-docs/terraform-docs) to learn more about the utility. 

You must have a self-explanatory README.md as a part of all your Terraform projects.

## Practice 15: Take Advantage of Built-in Functions
Terraform has a lot of built-in functions that you can call on within expressions to alter and combine variables, ranging from math operations to file manipulation.

It is to be noted that the Terraform language does not support user-defined functions and therefore, only the built-in functions are accessible to use.

The Terraform console command allows you to experiment with the behavior of Terraform’s built-in functions from the Terraform expression console. 

Use Terraform’s built-in functions to manipulate values and strings within your Terraform configuration, perform mathematical computations, and execute other tasks.

Let’s execute the “terraform console” command and try some functions. 
  max(11, 12, 1)
  min(11, 12, 1)
  lower(“DEVOPS”)
  upper(“devops”)
  concat([“devops”, “terraform”], [“best”, “practices”])
  length(“devops”)
  base64encode(“devops”)
  base64decode(“ZGV2b3Bz”)
  timestamp()

## Practice 16: Use Workspaces
Workspaces are nothing but different instances of state data that can be used from the same working directory, which allow you to manage numerous non-overlapping resource groups with the same configuration. Furthermore, you can use ${terraform.workspace} to include the name of the current workspace in your Terraform configuration.

Make use of Terraform workspaces to create multiple environments like Dev, QA, UAT, Prod, and more using the same Terraform configuration files and saving the state files for each environment in the same backend.

terraform workspace list 
terraform workspace new dev
terraform workspace list 
terraform workspace show
terraform workspace select dev