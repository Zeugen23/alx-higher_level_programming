#!/bin/bash

# Check if a URL is provided as an argument
if [ $# -eq 0 ]; then
  echo "URL is missing. Please provide a URL as an argument."
  exit 1
fi

# Store the URL argument
url=$1

# Send the request using curl and capture the response headers
response_headers=$(curl -sI "$url")

# Extract the value of the Content-Length header
content_length=$(echo "$response_headers" | grep -i "Content-Length:" | awk '{print $2}' | tr -d '\r')

# Check if the Content-Length header is present
if [ -z "$content_length" ]; then
  echo "Content-Length header not found in the response."
  exit 1
fi

# Display the size of the response body in bytes
echo "Size of the response body: $content_length bytes"
