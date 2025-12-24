#!/bin/bash
ufw default deny incoming && ufw default allow outgoing && ufw allow 80/tcp && ufw --force enable && echo "Rules updated" && ufw6 default deny incoming && ufw6 default allow outgoing && ufw6 allow 80/tcp && echo "Rules updated (v6)"
