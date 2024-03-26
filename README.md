# Terraform-aws-module-dataSource-
Creating a Terraform module for deploying secure EC2 instances with proper security configurations, including the utilization of the AWS AMI data source. This module can be easily invoked by other team members using Terraform module blocks

This project for creating Infrasture of following 

1. "Module-1 for EC2 instance", don't need to define ami_id for instance because here terraform "Data source" is used for retrieving ami_id for instance,
  This is name of ami_id for Free tier amazon linux ami (al2023-ami-*-x86_64); 'variables for name of instance & instance type'.

2. "Module-2 for aws_security_grp" which allow inbound traffic to EC2; 'variables for VPC id & security grp name'.

3. "Here gives variables 

   NOTE: This modules kept in seperate folder and this modules will be called by TeamA, TeamB, TeamC for lanching instance
