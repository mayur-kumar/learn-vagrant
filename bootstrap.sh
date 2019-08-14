#!/bin/bash

# Update hosts file
echo "[TASK 1] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
172.168.10.99 rmaster.test.com rmaster
172.168.10.100 kmaster.test.com kmaster
172.168.10.101 kworker1.test.com kworker1
172.168.10.102 kworker2.test.com kworker2
EOF
