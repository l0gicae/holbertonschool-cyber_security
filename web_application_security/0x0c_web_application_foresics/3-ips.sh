#!/bin/bash
grep -i "Accepted password for root" auth.log | awk '{print $11}' | sort -u | wc -l
