#!/bin/bash

# Read from stdin
while IFS= read -r line; do
  # Check if the line matches a function definition pattern
  if [[ $line =~ ^[[:space:]]*[\w_]+\s*=*\s*function[[:space:]]*.*$ ]]; then
    continue  # Skip function definitions
  fi

  # Output the line
  echo "$line"
done
