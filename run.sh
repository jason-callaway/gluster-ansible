#!/usr/bin/env bash

printf "Refreshing EC2 cache..."
./inventory/aws/hosts/ec2.py --refresh-cache
printf "done\n"

ssh-add -l >/dev/null 2>&1
if [ "$?" != "0" ]
then
    # For additional debug: -vvvvv and ANSIBLE_KEEP_REMOTE_FILES=1
    ansible-playbook -v -i inventory/aws/hosts/ec2.py gluster_setup.yaml
else
    echo "You must run this with ssh-agent holding a key via ssh-add"
    exit 1
fi