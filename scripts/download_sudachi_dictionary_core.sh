#!/bin/bash

# Define the URL and target directory
URL="http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict/sudachi-dictionary-latest-core.zip"
TARGET_DIR="$(dirname "$0")/../sudachi"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Download the file
curl -L -o /tmp/sudachi-dictionary.zip "$URL"

# Extract the file to a temporary directory
TEMP_DIR=$(mktemp -d)
unzip -o /tmp/sudachi-dictionary.zip -d "$TEMP_DIR"

# Move the contents of the extracted directory to the target directory
mv "$TEMP_DIR"/*/* "$TARGET_DIR"

# Clean up the downloaded zip file
rm /tmp/sudachi-dictionary.zip

# Ensure TEMP_DIR is not empty before removing
if [ -n "$TEMP_DIR" ]; then
  rm -rf "$TEMP_DIR"
else
  echo "Error: TEMP_DIR is empty or unset. Skipping removal."
fi

echo "Sudachi dictionary downloaded and extracted to $TARGET_DIR"
