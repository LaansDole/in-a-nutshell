#!/bin/bash
# This script will connect to an ec2 instance using ssh and a pem file
# The pem file and the ec2 address can be provided as command-line arguments
# If no arguments are provided, it will use the default values
# Usage: ./connect_ec2.sh [pem_file] [ec2_address] [--verbose|-v]

# Default values
default_pem_file="tomcat-maven-key.pem"
default_ec2_address="ec2-user@ec2-3-90-41-198.compute-1.amazonaws.com"

# Initialize variables with default values
pem_file="$default_pem_file"
ec2_address="$default_ec2_address"

# Parse command-line arguments
while (( "$#" )); do
  case "$1" in
    -v|--verbose)
      verbose=1
      shift
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      if [[ -z $pem_file ]] || [[ $pem_file == "$default_pem_file" ]]; then
        pem_file="$1"
      elif [[ -z $ec2_address ]] || [[ $ec2_address == "$default_ec2_address" ]]; then
        ec2_address="$1"
      fi
      shift
      ;;
  esac
done

# Check if the pem file exists and is readable
if [ ! -f "$pem_file" ] || [ ! -r "$pem_file" ]; then
  echo "The pem file $pem_file does not exist or is not readable."
  exit 1
fi

# Verbose output
if [[ $verbose == 1 ]]; then
  echo "./connect_ec2.sh  \"$pem_file\" \"$ec2_address\""
  echo "\$pem_file = $pem_file"
  echo "\$ec2_address = $ec2_address"
fi

# Connect to the ec2 instance using ssh
ssh -i "$pem_file" "$ec2_address"
