#!/bin/bash

# Use the AWS CLI to list all Lambda functions in the current AWS account in all regions
echo "# Listing all Lambda functions by region"
echo

# Get all AWS regions
regions=$(aws ec2 describe-regions --query "Regions[*].RegionName" --output text)

# Loop through each region and list Lambda functions
for region in $regions; do
    echo "## $region"
    aws lambda list-functions \
        --region "$region" \
        --query "Functions[*].FunctionName" \
        --output text | xargs -n 1 printf "\- %s\\n"
    echo
done
