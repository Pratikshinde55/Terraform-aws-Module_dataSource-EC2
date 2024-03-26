# Terraform-aws-module-dataSource-
Creating a Terraform module for deploying secure EC2 instances with proper security configurations, including the utilization of the AWS AMI data source. This module can be easily invoked by other team members using Terraform module blocks

This project for creating Infrasture of following 

1. " Module for EC2 instance , don't need to define ami_id for instance because here terraform "Data source" is used for retrieving ami_id for instance,
  This is name of ami_id for Free tier amazon linux ami (al2023-ami-*-x86_64)
