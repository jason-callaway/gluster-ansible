#!/usr/bin/env bash

printf "Refreshing EC2 cache..."
#./inventory/aws/hosts/ec2.py --refresh-cache
printf "done\n"

ANSIBLE_KEEP_REMOTE_FILES=1 ansible-playbook -vvvv -i inventory/aws/hosts/ec2.py gluster_setup.yaml
