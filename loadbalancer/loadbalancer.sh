#!/bin/bash

CFN_FILE="loadbalancer.yaml"
#BUCKET="" 
REGION="us-east-1" 
STACK_NAME="WebAppALB"
PARAMETERS=$(jq -r '.[] | "\(.ParameterKey)=\(.ParameterValue)"' parameters.json | tr '\n' ' ')

# deploy
aws cloudformation deploy --stack-name $STACK_NAME \
 --region $REGION --template-file "$CFN_FILE" \
 --tags group=WebApp-ALB --disable-rollback \
 --parameter-overrides $PARAMETERS \
 --capabilities CAPABILITY_NAMED_IAM


# use if review process needed
#   --no-execute-changeset \