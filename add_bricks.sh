#!/usr/bin/env bash

if [ ${#} -ne 1 ]
then
    echo "specify number of nodes per AZ"
fi

printf "Refreshing EC2 cache (1 of 2)..."
./inventory/aws/hosts/ec2.py --refresh-cache
printf "done\n"

ssh-add -l >/dev/null 2>&1
if [ "${?}" == "0" ]
then
    ansible-playbook -v -i inventory/aws/hosts/ec2.py \
                     --extra-vars "nodes_per_az=${1}" \
                     gluster_add_brick_prep.yaml
    if [ "${?}" != "0" ]; then exit 1; fi
    printf "Refreshing EC2 cache (2 of 2)..."
    ./inventory/aws/hosts/ec2.py --refresh-cache
    printf "done\n"
    ansible-playbook -v -i inventory/aws/hosts/ec2.py \
                     gluster_add_brick.yaml
    if [ "${?}" == "0" ]
    then
        cp gluster_hosts gluster_hosts.last
    fi
else
    echo "You must run this with ssh-agent holding a key via ssh-add"
    exit 1
fi