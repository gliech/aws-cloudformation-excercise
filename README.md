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

### ansible
Contains two templates. First a main stack, very similar to the last template
from the cfn-init directory, but with the configuration sections removed.
Secondly a stack that installs an Ansible server into an existing network, and
is used as nested stack in the first template. This project needs a view
external dependencies to run:
1. A git repository containing an Ansible project with a site.yml playbook in its root directory
2. An Amazon S3 Bucket containing the following files
    - **SubStack-AnsibleServer.yml** The template for the nested stack
    - **GitAccess.sec** An SSH private key used to fetch the contents of the git repository
    - **AnsibleMgmt.sec** An SSH private key that Ansible can use to connect to the other hosts in the stack

### elasticbeanstalk
My attempt at integrating Elastic Beanstalk with Cloudformation.  
The [build-wordpress.sh](elasticbeanstalk/build-wordpress.sh) script downloads
the latest wordpress release and packages it together with the contents of 
[wordpress.config/](elasticbeanstalk/wordpress.config/) into a .zip
archive, that can be used as Source Bundle for Beanstalk Application Versions.  
For more information on the Cloudformation Stacks, refer to my
[presentation](elasticbeanstalk/presentation/beanstalk-slides.pdf) (German)
