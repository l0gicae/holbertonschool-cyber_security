#!/bin/bash
sudo nmap -sM -vv --reason -p ftp,ssh,telnet,http,https "$1"
