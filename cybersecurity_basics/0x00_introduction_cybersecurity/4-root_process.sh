#!/bin/bash
ps aux | awk -v u="$1" '$1==u' | grep -vE ' 0 +0 '
