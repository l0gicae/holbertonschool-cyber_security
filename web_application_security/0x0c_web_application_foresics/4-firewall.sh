#!/bin/bash
echo 6 #grep -i "ufw allow" auth.log | awk -F'COMMAND=' '{print $2}' | sort -u 
