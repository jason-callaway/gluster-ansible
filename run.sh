#!/usr/bin/env bash

printf "Refreshing EC2 cache..."
#./inventory/aws/hosts/ec2.py --refresh-cache
printf "done\n"

ansible-playbook -i inventory/aws/hosts/ec2.py gluster_setup.yaml
