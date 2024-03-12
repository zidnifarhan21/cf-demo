#!/bin/bash
CFN_FILE="network.yaml"
#BUCKET=""
REGION="us-east-1" 
STACK_NAME="Network"
PARAMETERS=$(jq -r '.[] | "\(.ParameterKey)=\(.ParameterValue)"' parameters.json | tr '\n' ' ')

# deploy
aws cloudformation deploy --region $REGION \
 --stack-name $STACK_NAME --template-file "$CFN_FILE" \
 --tags group=WepApp-compute \
 --parameter-overrides $PARAMETERS --capabilities CAPABILITY_NAMED_IAM