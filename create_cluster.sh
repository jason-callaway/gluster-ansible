#!/usr/bin/env bash

if [ ${#} -ne 1 ]
then
    echo "specify number of nodes per AZ"
    exit 1
fi

printf "Refreshing EC2 cache (1 of 2)..."
./inventory/aws/hosts/ec2.py --refresh-cache
printf "done\n"

ssh-add -l >/dev/null 2>&1
if [ "${?}" == "0" ]
then
    # For additional debug: -vvvvv and ANSIBLE_KEEP_REMOTE_FILES=1
    ansible-playbook -v -i inventory/aws/hosts/ec2.py \
                     --extra-vars "nodes_per_az=${1}" \
                     gluster_setup_prep.yaml
    # We have to run two playbooks in order to update the dynamic ec2 inventory
    printf "Refreshing EC2 cache (2 of 2)..."
    ./inventory/aws/hosts/ec2.py --refresh-cache
    printf "done\n"
    ansible-playbook -v -i inventory/aws/hosts/ec2.py gluster_setup.yaml
    # We need to compare current vs last in the add step
    cp gluster_hosts gluster_hosts.last
    head -n 1 gluster_hosts | cut -d, -f1 > node_zero
else
    echo "You must run this with ssh-agent holding a key via ssh-add"
    exit 1
fi
