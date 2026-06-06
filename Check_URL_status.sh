#!/bin/bash

# Assigning URL to check
URL="https://www.guvi.in"

# Fetch HTTP status code using curl
status_code=$(wget --server-response --spider $URL 2>&1 | awk '/HTTP\// {print $2}' | tail -1)

# Print the status code
echo "HTTP Status Code: $status_code"

# Check status code and print message
if [ "$status_code" -eq 200 ]; then
    echo "Success: Website is reachable."
elif [ "$status_code" -ge 400 ] && [ "$status_code" -lt 500 ]; then
    echo "Failure: Client error occurred."
elif [ "$status_code" -ge 500 ]; then
    echo "Failure: Server error occurred."
else
    echo "Unknown response."
fi