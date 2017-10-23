# AWS Cloudformation Wordpress Exercise
This repository contains a number of Cloudformation templates, that deploy
Wordpress as an example for web applications in different ways.

### cfn-init
Each template in this directory is meant to be executed on its own and expands
upon the previous one. Their functionality ranges from spinning up a single
EC2 Instance in a VPC to deploying a Wordpress web application as
AutoScalingGroup, complete with public and private subnets, an application
loadbalancer, RDS as database solution and a bastion host for SSH access. All
configuration management is done using cfn-helper scripts.
