#!/bin/bash
sudo nmap -T2 -f -sF -p 80-85 '$1'
