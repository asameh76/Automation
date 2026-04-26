#!/bin/bash
# Gem Gyms n8n Data Backup Script

BACKUP_DIR="/home/asameh11021976/n8n/n8n_data"
ZIP_NAME="n8n_backup_$(date +%Y-%m-%d).zip"
TEMP_ZIP="/tmp/$ZIP_NAME"

# Rclone Remote Name
REMOTE="gdrive:GemGyms_Backups"

echo "Starting backup of n8n data..."
# Create a temporary zip file
cd /home/asameh11021976/n8n
sudo zip -r $TEMP_ZIP n8n_data

# Upload to Google Drive using Rclone
echo "Uploading to Google Drive..."
rclone copy $TEMP_ZIP $REMOTE

# Check if successful
if [ $? -eq 0 ]; then
  echo "Backup successful! ($ZIP_NAME)"
  # Remove temp file
  rm $TEMP_ZIP
else
  echo "Backup failed. Please check rclone connection."
  exit 1
fi
