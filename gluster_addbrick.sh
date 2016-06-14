#!/bin/bash

gluster volume add-brick demovol replica 2 ec2-54-175-170-107.compute-1.amazonaws.com:/bricks/brick1/brick ec2-54-164-119-133.compute-1.amazonaws.com:/bricks/brick1/brick 

