#!/bin/bash
# Moltoo Housekeeping: Log Rotation
# Deletes logs older than 7 days in the workspace
find /home/asameh11021976/.openclaw/workspace -type f -name "*.log" -mtime +7 -exec rm -f {} \;
echo "[$(date)] Moltoo Log Rotation Complete. Cleaned logs older than 7 days." >> /home/asameh11021976/scripts/housekeeping.log

