#!/usr/bin/env bash

printf "Refreshing EC2 cache..."
./inventory/aws/hosts/ec2.py --refresh-cache
printf "done\n"

# -vvvvv
# ANSIBLE_KEEP_REMOTE_FILES=1
ansible-playbook -vvv -i inventory/aws/hosts/ec2.py \
                 --ssh-extra-args="-i ~/crypto/nsphexboard.pem" \
                 gluster_setup.yaml
