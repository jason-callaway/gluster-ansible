#!/bin/bash

gluster volume info demovol >/dev/null 2>&1
if [ "${?}" != "0" ]
then
  gluster volume create demovol replica 2 transport tcp ec2-52-91-105-144.compute-1.amazonaws.com:/bricks/brick1/brick ec2-52-91-45-88.compute-1.amazonaws.com:/bricks/brick1/brick ec2-54-152-123-29.compute-1.amazonaws.com:/bricks/brick1/brick ec2-54-84-188-201.compute-1.amazonaws.com:/bricks/brick1/brick ec2-54-164-219-109.compute-1.amazonaws.com:/bricks/brick1/brick ec2-54-84-170-244.compute-1.amazonaws.com:/bricks/brick1/brick ec2-52-91-208-73.compute-1.amazonaws.com:/bricks/brick1/brick ec2-52-91-229-78.compute-1.amazonaws.com:/bricks/brick1/brick 
  gluster volume start demovol
fi

