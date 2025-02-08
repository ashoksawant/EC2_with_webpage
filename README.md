# AWS EC2 Instance with Apache Web Server

This Terraform configuration file sets up an AWS EC2 instance with an Apache web server. The instance is configured to automatically install and start the Apache server, and it serves a simple HTML page.


## Prerequisites

- Terraform installed on your local machine
- AWS account with appropriate permissions
- AWS CLI configured with your credentials

## Configuration
Using a .env file can be a good practice for managing environment variables, including sensitive information like AWS access keys and secret keys. Here are some benefits and considerations:
Create a .env File:
AWS_ACCESS_KEY_ID=your_access_key
AWS_SECRET_ACCESS_KEY=your_secret_key
AWS_DEFAULT_REGION=your_region
Using PowerShell:
Get-Content .env | ForEach-Object { $name, $value = $_ -split '='; [System.Environment]::SetEnvironmentVariable($name.Trim(), $value.Trim(), [System.EnvironmentVariableTarget]::Process) }
OR
using (zsh)bash:
source .env

### Variables

- `ec2_image`: The AMI ID for the EC2 instance.
- `vpc_security_group_ids`: The security group ID for the EC2 instance.
- `subnet_id`: The subnet ID where the EC2 instance will be launched.

### Resources

- `aws_instance.My_webserver`: Creates an EC2 instance with the specified AMI, instance type, and security group. It also associates a public IP address and installs Apache web server.

## Usage

1. Clone the repository and navigate to the directory containing the Terraform configuration files.
2. Initialize Terraform:
   ```sh
terraform init
terraform plan
terraform apply
terraform destroy

