#!/usr/bin/env bash

COLOR_BLUE='\033[0;34m'
COLOR_NULL='\033[0m'

if [[ ! -d .ssh ]]; then
   echo -e "${COLOR_BLUE}Creating directory for SSH keys${COLOR_NULL}"
   mkdir .ssh
fi

echo -e "${COLOR_BLUE}Genearting SSH keys${COLOR_NULL}"
ssh-keygen -t rsa -f .ssh/id_rsa -C "user@distributed" -N ""

echo -e "${COLOR_BLUE}Add public key to authorized_keys${COLOR_NULL}"
cat .ssh/id_rsa.pub >> .ssh/authorized_keys

echo -e "${COLOR_BLUE}Done!${COLOR_NULL}"
