# gluster-ansible
Ansible playbook for setting up demo Gluster environments

This tool will use Ansible to deploy community Gluster on RHEL AWS instances.

## Not for production
Note that this repo is currently only good for showing the "art of the possible." We're working on making this more production-ready, but it's not there yet.

## Attribution
We used the [OpenShift 3 Roadshow demo-ansible repo](https://github.com/2015-Middleware-Keynote/demo-ansible) as inspiration.

## Setup
In order to use this demo, you need to have:
* An account with [Amazon Web Services](https://aws.amazon.com/premiumsupport/signup/)
* Ansible [installed locally](http://docs.ansible.com/ansible/intro_installation.html)
* [Python 2.7](https://www.python.org/downloads/)
* AWS CLI tools [installed](http://docs.aws.amazon.com/cli/latest/userguide/installing.html#install-with-pip)
** You must run `aws configure` and populate your access and secret key variables

## Usage
Once you have the tools from above installed and configured, use this process to quickly spin up a distributed, replicated Gluster volume.

First, review the default settings in [vars.yaml](vars.yaml).

```
$ git clone https://github.com/jason-callaway/demo-ansible.git
$ cd demo-ansible
$ ./create_cluster.sh 4 # Create a cluster with 4 nodes per AZ
```

Now you've got a distributed, replicated volume. Good job!

If you want to add space to this volume, use the (add_brick.sh)[add_brick.sh] script.

```
$ ./add_brick.sh 5 # One higher node per AZ than we used in the create step
```

