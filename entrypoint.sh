#!/usr/bin/env bash

COLOR_BLUE='\033[0;34m'
COLOR_NULL='\033[0m'

echo -e "${COLOR_BLUE}Starting SSH Server${COLOR_NULL}"
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys
/usr/sbin/sshd -p 22222

echo -e "${COLOR_BLUE}Executing command${COLOR_NULL}"
exec "$@"
