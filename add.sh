#!/usr/bin/env bash

printf "Refreshing EC2 cache (1 of 2)..."
./inventory/aws/hosts/ec2.py --refresh-cache
printf "done\n"

ssh-add -l >/dev/null 2>&1
if [ "${?}" == "0" ]
then
    ansible-playbook -v -i inventory/aws/hosts/ec2.py \
                     --extra-vars "nodes_per_az=2" \
                     gluster_add_brick_prep.yaml
    printf "Refreshing EC2 cache (2 of 2)..."
    ./inventory/aws/hosts/ec2.py --refresh-cache
    printf "done\n"
    ansible-playbook -v -i inventory/aws/hosts/ec2.py \
                     gluster_add_brick.yaml
else
    echo "You must run this with ssh-agent holding a key via ssh-add"
    exit 1
fi