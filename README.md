# VPC-aws

# Prerequisites

To follow this code you will need:

The Terraform CLI (0.14.9+) installed.

The AWS CLI installed.

An AWS account.

Your AWS credentials. You can create a new Access Key on this page.

Configure the AWS CLI from your terminal. Follow the prompts to input your AWS Access Key ID and Secret Access Key.

$ aws configure

The configuration process stores your credentials in a file at ~/.aws/credentials on MacOS and Linux, or %UserProfile%\.aws\credentials on Windows.The set of files used to describe infrastructure in Terraform is known as a Terraform configuration.Each Terraform configuration must be in its own working directory. Create a directory for your configuration.

# Initialize the directory
When you create a new configuration — or check out an existing configuration from version control — you need to initialize the directory with terraform init.
Initializing a configuration directory downloads and installs the providers defined in the configuration, which in this case is the aws provider.
Initialize the directory.

$ terraform init

Terraform downloads the aws provider and installs it in a hidden subdirectory of your current working directory, named .terraform. The terraform init command prints out which version of the provider was installed. Terraform also creates a lock file named .terraform.lock.hcl which specifies the exact provider versions used, so that you can control when you want to update the providers used for your project.


# Format and validate the configuration
We recommend using consistent formatting in all of your configuration files. The terraform fmt command automatically updates configurations in the current directory for readability and consistency.
Format your configuration. Terraform will print out the names of the files it modified, if any. In this case, your configuration file was already formatted correctly, so Terraform won't return any file names.

$ terraform fmt

You can also make sure your configuration is syntactically valid and internally consistent by using the terraform validate command.
Validate your configuration. The example configuration provided above is valid, so Terraform will return a success message.

$ terraform validate

Success! The configuration is valid.

# Create infrastructure

Apply the configuration now with the terraform apply command. Terraform will print output similar to what is shown below. We have truncated some of the output to save space.

$ terraform apply


Before it applies any changes, Terraform prints out the execution plan which describes the actions Terraform will take in order to change your infrastructure to match the configuration.

Terraform will now pause and wait for your approval before proceeding. If anything in the plan seems incorrect or dangerous, it is safe to abort here with no changes made to your infrastructure.
