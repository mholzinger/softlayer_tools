#!/bin/bash

slcli server list |\
  awk '{print $1}'|\
  xargs -L 1 slcli server detail --passwords |\
  grep -E 'fqdn|ipmi_ip|remote users'|\
  awk '{print $NF}'|\
  paste - - -|\
  awk '{print $1 "=" $2 ":" "ipmi_pass_" $3}'

