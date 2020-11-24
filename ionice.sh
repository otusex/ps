#!/bin/bash

time ionice -c1 -n0 su -c "dd if=/dev/zero of=/tmp/iodirect.img bs=512 count=1M oflag=direct" &
time ionice -c2 -n7 su -c "dd if=/dev/zero of=/tmp/io2direct.img bs=512 count=1M oflag=direct" &


time ionice -c1 -n0 su -c "dd if=/dev/zero of=/tmp/io.img bs=512 count=1M" &
time ionice -c2 -n7 su -c "dd if=/dev/zero of=/tmp/io2.img bs=512 count=1M" &

