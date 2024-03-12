#!/bin/bash

CFN_FILE="compute.yaml"
#BUCKET="" 
REGION="us-east-1" 
STACK_NAME="Compute"
PARAMETERS=$(jq -r '.[] | "\(.ParameterKey)=\(.ParameterValue)"' parameters.json | tr '\n' ' ')

# deploy
aws cloudformation deploy --stack-name $STACK_NAME --region $REGION --template-file "$CFN_FILE" --tags group=Compute --parameter-overrides $PARAMETERS --capabilities CAPABILITY_NAMED_IAM
