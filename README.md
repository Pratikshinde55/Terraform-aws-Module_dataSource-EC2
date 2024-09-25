# Creating a Terraform module for deploying secure EC2 instances with proper security configurations, including the utilization of the AWS AMI data source. 
This module can be easily invoked by other team members using Terraform module blocks

![image](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/7b0f0e91-6dda-4945-be1a-78c5368012d1)

- This project for creating infrastructure of following:--

1. "Module-1 for EC2 instance", don't need to define ami_id for instance because here terraform "Data source" is used for retrieving ami_id for instance,
   This is name of ami_id for Free tier amazon linux ami (al2023-ami-*-x86_64); 'variables for name of instance & instance type'.
2. "Module-2 for aws_security_grp" which allow inbound traffic to EC2; 'variables for VPC id & security grp name'.
   NOTE: This modules kept in seperate folder and this modules will be called by TeamA, TeamB, TeamC for lanching instance
4. "calling module block by using module block for launching EC2 instance with security group" for calling I created three Team folder where i put individual 
 plugins info and calling module blocks.

- Follwing is lists of folders for this project:

Inside the module folder one more folder created named as 'ec2-module' here i kept my Modules.

![image](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/bd7e3d76-90a6-44c4-9db9-12bc1aca5e91)

## Modules steps are following 

In module folder only put code of infrastucture & and apply this infrastructure in others folder named as TeamA, TeamB, TeamC.

### Step-1: [Create main.tf file for ec2 instance and ami_id retrieving Data Source]

In this file contain 'Data source' "aws_ami" for retrieving ami id for instance , The information retrieve before resource creates is known as Data source.

**"most_recent"**: is set to true, indicating that the most recent version of the AMI should be used.

**"owners"**: is set to ["amazon"], specifying that only AMIs owned by Amazon should be considered.

**"Filter"**: is sub block of data source for specify 'data type' information.

- Three filters are applied for AMIs:
  
AMI name matching the pattern "al2023-ami-*-x86_64".
   
Root device type is set to "ebs".
   
Virtualization type is set to "hvm".

**"ami"**: attribute of the "aws_instance" resource is being assigned the value of 'data.aws_ami.amazonaminame.id' attribute referance this take ami id form data 
block.

       notepad main.tf

![tf-ec2_module_dataSource-main tf](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/f80a11e9-fd2b-4037-933a-042c79919846)


### Step-2: [Create tf sec_grp.tf file for security group details , here use loop:]

**"aws_security_group"** =  AWS security group resource named "allow" is defined for create security group.
  
**"name"**: attribute is set to "terra_allow_" followed by the value of the variable "security_grp_name", likely creating a unique name for the security group.
  
**"description"**: attribute is set to describe the purpose of the security group.

**"vpc_id"**: attribute is set to the value of the variable "vpcID", specifying the VPC in which the security group is to be created.

**"ingress"** = block Inside a dynamic block, the "ingress" block is defined to allow inbound traffic, Dynamic is make to manage ingress block dyanamically. 
  (ingress = inbound rule)

**"for_each"**: argument iterates over each element in the list of ports. for each is type of loop, var.sgports varible for providing lists of port numbers,

**"iterator"**: argument assigns a name to the current element in the iteration, which is referenced as "port" within the block.

**"Content"** = block of dynamic block where we put things which want to manage dynamically.

**"protocol"**: Specifies the protocol for the traffic, in this case, "tcp.

**"cidr_blocks"**: Allows traffic from any source IP ("0.0.0.0/0").

**"egress"** = block which control outbound traffic from the instances associated with the security group.

**"from_port"** and **"to_port"**: attributes are set to 0, indicating that all ports are allowed for outbound traffic.

**"protocol"**: attribute is set to "-1", indicating that all protocols are allowed for outbound traffic.

**"cidr_blocks"**: attribute is set to ["0.0.0.0/0"], allowing outbound traffic to any destination IP address.

      notepad sec_grp.tf &

![tf-sec_grp-module](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/79923a65-b1ac-472a-a642-bbba1f9395df)

### Step-3: [Create variables.tf file for varibles of main.tf & sec_grp.tf (in HCL file i provided i keep varibles in modules not created separate file]

Here varibles for resource ec2 & security group:

     notepad variables.tf &

![tf-ec2-variables](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/bbc47f63-79ec-4275-8426-65bd68138e51)


## TeamA calling module for launch EC2 Instance 

Create main.tf file for plugin with AWS provider, credentials, "module block calling":

Here "terraform" block for plugin with AWS provider, "provider" block for credentials (AAWS CLI tool used for access & secret key of AMI user.

**"module"** = block for calling module , 

**"source"**: attribute specifies the relative path to the directory containing the module configuration. In this case, it's "../module/ec2-module".

**"tagname"**: This module varible for name instance tag.

**"OStype"**: this is for type of instance such t2.micro , t2.large ,etc.

**"security_grp_name"**: this is for name security grp which connect to EC2 instance.


![tf-TeamA-main tf](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/0b228b65-cff4-4568-81e5-128ed7b64d0a)

Terraform init  coomand use to plugin: 

     terraform init

Terraform apply cmd for to create entire infrastucture as code:

     terraform apply

![tf-TeamA-apply](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/c1d47f95-db17-4f9e-9519-ff82d0614b2e)

## TeamB calling module for launch instance

Create main.tf file for plugin with AWS provider , credentials, "module block calling"


![tf-TeamB-main tf](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/5661114d-6f2c-4211-9c7b-6c5c4c7dc2c1)

Terraform init command use to plugins:

     terraform init

Terraform apply cmd for to create entire infrastucture as code:

     terraform apply

![tf-TeamB-apply](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/991b9074-d8fc-4123-8b3a-b3b0910a36fe)

## TeamC calling module for launch instance 

Create main.tf file for plugin with AWS provider, Credentials,"module block calling"

![tf-TeamC-main tf](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/82bbbe04-4bf6-402c-9cea-c37fe0ac1939)

Terraform init command use to plugins: 

      terraform init

Terraform apply cmd for to create entire infrastucture as code:

      terraform apply
       
![tf-TeamC-apply](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/6dcfeda5-3499-414c-b988-ebfe2bc5a449)

## On AWS console

Instances is lanuched by TeamA, TeamB, TeamC by using Terraform IaC :

![Screenshot 2024-03-26 225352](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/dc408713-a2c1-40a8-bd44-d643095927fb)


Also security group is created by TeamA, TeamB, TeamC:

![Screenshot 2024-03-26 222831](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/e199424c-f22d-46c5-8ac6-5de68a3f2e9e)


**security_grp for TeamA**:

![Screenshot 2024-03-26 222944](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/a449e0aa-0d7d-4502-84ec-96820d944567)

**security_grp for TeamB**:

![Screenshot 2024-03-26 223010](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/1da6ffda-36d9-4b16-a495-8c3e8a1e6b09)

**security_grp for TeamC**:

![Screenshot 2024-03-26 223038](https://github.com/Pratikshinde55/Terraform-aws-module-dataSource-/assets/145910708/7aabc04e-941f-4a7a-9816-b2156ab60e19)


