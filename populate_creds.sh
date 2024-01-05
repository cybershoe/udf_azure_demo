#!/bin/bash
SELF=$_
(return 0 2>/dev/null) && sourced=1 || sourced=0
if [ "$sourced" -eq "0" ]; then
	>&2 echo "This script must be sourced (i.e.: \"source $SELF\")"
	exit -1
fi
 
METADATA=$(curl -s http://metadata.udf/cloudAccounts | jq -r '.cloudAccounts[0]')
echo "Environment Variable        | Value"
echo "============================+=================================================="
export TF_VAR_resource_group_name=$(echo $METADATA | jq -r '.resourceGroup')
echo "TF_VAR_resource_group_name: | $AZURE_RESOURCE_GROUP"
export ARM_TENANT_ID=$(echo $METADATA | jq -r '.credentials[0].tenant')
echo "ARM_TENANT_ID:              | $ARM_TENANT_ID"
export ARM_CLIENT_ID=$(echo $METADATA | jq -r '.credentials[0].username')
echo "ARM_CLIENT_ID:              | $ARM_CLIENT_ID"
export ARM_CLIENT_SECRET=$(echo $METADATA | jq -r '.credentials[0].password')
if [ $ARM_CLIENT_SECRET == "null" ]; then
	echo "ARM_CLIENT_SECRET:          | null" 
else
	echo "ARM_CLIENT_SECRET:          | <hidden>"
fi
