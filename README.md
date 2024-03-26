# Terraform-aws-module-dataSource-
Creating a Terraform module for deploying secure EC2 instances with proper security configurations, including the utilization of the AWS AMI data source. This module can be easily invoked by other team members using Terraform module blocks

This project for creating Infrasture of following 

1. "Module-1 for EC2 instance", don't need to define ami_id for instance because here terraform "Data source" is used for retrieving ami_id for instance,
  This is name of ami_id for Free tier amazon linux ami (al2023-ami-*-x86_64); 'variables for name of instance & instance type'.

2. "Module-2 for aws_security_grp" which allow inbound traffic to EC2; 'variables for VPC id & security grp name'.

3. "Here gives variables 

   NOTE: This modules kept in seperate folder and this modules will be called by TeamA, TeamB, TeamC for lanching instance


Follwing is lists of folders for this project:

Inside the module folder one more folder created named as 'ec2-module' here i kept my Modules.

![image](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/bd7e3d76-90a6-44c4-9db9-12bc1aca5e91)

❄️ Modules steps are following ❄️

Step-1: 

create main.tf file for ec2 instance and ami_id retrieving data source :


![tf-ec2_module_dataSource-main tf](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/f80a11e9-fd2b-4037-933a-042c79919846)


Step-2:

create tf sec_grp.tf file for security group details , here use loop 

![tf-sec_grp-module](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/79923a65-b1ac-472a-a642-bbba1f9395df)

Step-3:

create variables.tf file for varibles of main.tf & sec_grp.tf (in HCL file i provided i keep varibles in modules not created separate file:

![tf-ec2-variables](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/bbc47f63-79ec-4275-8426-65bd68138e51)


❄️TeamA calling module for launch instance ❄️

create main.tf file for plugin with AWS provider , credentials, "module block calling"


![tf-TeamA-main tf](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/0b228b65-cff4-4568-81e5-128ed7b64d0a)

terraform init  coomand use to piugins 


       # terraform init

terraform apply cmd for to create entire infrastucture as code:

       #terraform apply

![tf-TeamA-apply](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/c1d47f95-db17-4f9e-9519-ff82d0614b2e)



❄️TeamB calling module for launch instance ❄️

create main.tf file for plugin with AWS provider , credentials, "module block calling"

![tf-TeamB-main tf](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/5661114d-6f2c-4211-9c7b-6c5c4c7dc2c1)


terraform init  coomand use to piugins 

       # terraform init

terraform apply cmd for to create entire infrastucture as code:

       #terraform apply

![tf-TeamB-apply](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/991b9074-d8fc-4123-8b3a-b3b0910a36fe)


❄️TeamC calling module for launch instance ❄️

create main.tf file for plugin with AWS provider , credentials, "module block calling"

![tf-TeamC-main tf](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/82bbbe04-4bf6-402c-9cea-c37fe0ac1939)

terraform init  coomand use to piugins 

       # terraform init

terraform apply cmd for to create entire infrastucture as code:

       #terraform apply
       
![tf-TeamC-apply](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/6dcfeda5-3499-414c-b988-ebfe2bc5a449)

🌟On AWS console 🌟

Instances is lanuched by TeamA, TeamB, TeamC:

![Screenshot 2024-03-26 225352](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/dc408713-a2c1-40a8-bd44-d643095927fb)


Also security group is created by TeamA, TeamB, TeamC:

![Screenshot 2024-03-26 222831](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/e199424c-f22d-46c5-8ac6-5de68a3f2e9e)


