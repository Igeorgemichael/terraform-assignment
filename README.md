## [Terraform-Exercise]() 1
### Task: 

Using Terrafrom create an aws instance (ubuntu) in multiple regions (free-tier) (eu-west-1 and eu-central-1)

- should be on minimum of 2 availablity zones

- should be reuseable

- can be built on multiple environments (dev, prod)

- should have a script that creates ansible, docker container

- your scripts should be modularized

- Create a VPC for the various environments

---

## 1. Introduction

This document aims to provide a comprehensive understanding of the Terraform project, which is designed to simplify the process of deploying and managing infrastructure on AWS. The project is structured into multiple modules that cater to different functionalities such as VPC creation, security group configuration, and EC2 instance provisioning. It is also built to support multiple environments, including “dev and prod,” each of which is located in a different region (eu-west-1 and eu-central-1), with a minimum of 2 availability zones in each region. Moreover, the project includes a bash script that automates the installation of Ansible and Docker on the EC2 instances, thereby streamlining the deployment process.

## 2. Prerequisites

Before using this Terraform project, please make sure that the following prerequisites are met:

1. You have an AWS account and have the necessary credentials to access the account.
2. You have installed and configured AWS CLI on your local machine.
3. Terraform has been installed on your local machine. 

These prerequisites are essential for the successful execution of the Terraform project.

## 3. Directory Structure

```plaintext
--dev
    --provider.tf
    --main.tf
    --variables.tf
    --terraform.tfvars
--prod
    --provider.tf
    --main.tf
    --variables.tf
    --terraform.tfvars
--modules
  --vpc
    --main.tf
    --variables.tf
    --outputs.tf
  --ec2
    --main.tf
    --variables.tf
    --outputs.tf       
```
The project directory includes a folder named **modules** that contains separate modules for VPC (Network) and ec2 (instance).

Additionally, there is a folder named **environments** that holds environment-specific configurations for both the development and production environments.

Lastly, there is a file named **terraform.tfvars** which is used to define Terraform variables specific to each environment.

## 4. VPC Module

### Vpc modules configuration

To set up a Virtual Private Cloud on AWS, the `modules/vpc` module takes charge. This module is made up of several crucial components that work together to create the VPC. These components include:

- VPC
- Subnet
- Security Group
- Internet Gateway
- Route Table
- Route Table Association


 1. The VPC module has a few outputs which might be useful to you. Firstly, the `subnet_id` output provides the unique ID of the subnet.
 2. Secondly, the `security_group_id` output provides the unique ID of the security group. 
 3. Finally, the `availability_zones` output provides the availability zone of the region where the VPC is located.
[View VPC Module Outputs](/modules/vpc/outputs.tf)

### 5. Instance Module

### EC2 module configuration

The `modules/ec2` Instance module is a tool that allows users to provision Amazon Elastic Compute Cloud (EC2) instances within specific subnets. 
This module is equipped with several features, including the ability to provision Ubuntu-focal-20.04 LTS Amazon Machine Images (AMIs) and generate key pairs for secure access to these instances. With these capabilities, this module offers a powerful toolset for managing EC2 instances securely and efficiently.
[View Instances Module Configuration](/modules/ec2/main.tf)

### ec2 module outputs
The `instance_ids` refer to the unique identifier assigned to each instance, while `public_ip_addresses` indicates the public IP address assigned to each instance.
[View EC2 Module Outputs](/modules/ec2/outputs.tf)

## 6. Environments

### Dev Environment

- Configuration for the development environment (`dev`).

### Prod Environment

- Configuration for the production environment (`prod`).

## 7. Best Practices
These practices ensure organized, maintainable, and error-free configurations.
- Terraform’s best practices include 
  - using consistent naming, 
  - adding comments, 
  - testing in non-prod, 
  - using modules and folders, 
  - defining env configs with vars, 
  - referencing outputs, and storing state files in a backend.
