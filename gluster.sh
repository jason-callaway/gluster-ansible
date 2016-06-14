---
#!/bin/bash

gluster peer probe ec2-52-90-142-128.compute-1.amazonaws.com
gluster peer probe ec2-54-174-67-0.compute-1.amazonaws.com
gluster peer probe ec2-52-90-239-171.compute-1.amazonaws.com
gluster peer probe ec2-54-164-168-89.compute-1.amazonaws.com
gluster peer probe ec2-52-91-84-124.compute-1.amazonaws.com
gluster peer probe ec2-54-88-237-141.compute-1.amazonaws.com
gluster volume create demovol replica2 transport tcp  ec2-52-90-142-128.compute-1.amazonaws.com:/bricks/brick1/brick ec2-54-174-67-0.compute-1.amazonaws.com:/bricks/brick1/brick ec2-52-90-239-171.compute-1.amazonaws.com:/bricks/brick1/brick ec2-54-164-168-89.compute-1.amazonaws.com:/bricks/brick1/brick ec2-52-91-84-124.compute-1.amazonaws.com:/bricks/brick1/brick ec2-54-88-237-141.compute-1.amazonaws.com:/bricks/brick1/brick