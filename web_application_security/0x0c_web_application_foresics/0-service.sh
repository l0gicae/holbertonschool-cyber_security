#!/bin/bash
grep -i "sshd" auth.log | awk '{print $6}' | sort | uniq -c | sort -rn
