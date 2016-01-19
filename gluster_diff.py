#!/usr/bin/python

with open('gluster_hosts') as h:
    hosts = h.read().splitlines()
with open('gluster_hosts.last') as l:
    last = l.read().splitlines()

hosts_set = set(hosts)
last_set = set(last)
diff_set = hosts_set - last_set

side_a = []
side_b = []
for new_host in diff_set:
    host, side = new_host.split(',')
    if "side_a" in side:
        side_a.append(host)
    if "side_b" in side:
        side_b.append(host)

for n in xrange(len(side_a)):
    print side_a[n] + ' ' + side_b[n]