#!/usr/bin/env bash

echo

check_vars()
{
    var_names=("$@")
    for var_name in "${var_names[@]}"; do
        [ -z "${!var_name}" ] && echo "$var_name is unset, please set the variable to auth" && var_unset=true
    done
    [ -n "$var_unset" ] && exit 1
    return 0
}

# Check general variables
check_vars AWS_ACCOUNT_NUMBER TIBANNA_AWS_REGION GLOBAL_ENV_BUCKET S3_ENCRYPT_KEY AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN

echo "The following arguments are currently set in the .env file:"
echo
echo "Account Number [AWS_ACCOUNT_NUMBER]: $AWS_ACCOUNT_NUMBER"
echo "Region [AWS_DEFAULT_REGION]: $AWS_DEFAULT_REGION"
echo "Environment [ENV_NAME]: $ENV_NAME"
echo "WFL Bucket [WFL_BUCKET]: $WFL_BUCKET"
echo "Project [PROJECT]: $PROJECT"
echo "Institution [INSTITUTION]: $INSTITUTION"
echo "Sentieon License [SENTIEON_LICENSE]: $SENTIEON_LICENSE"
echo

# Check S3_ENCRYPT_KEY_ID
if [ -z ${S3_ENCRYPT_KEY_ID+x} ];
then
  echo "S3_ENCRYPT_KEY_ID variable is NOT set for the environment"
else
  echo "S3_ENCRYPT_KEY_ID variable is set for the environment"
fi

echo

# Check confirmation
while true; do
    read -p "Does it look right? [y/n]: " yn
    case $yn in
        [Yy]* ) echo 'Deploying pipelines...'; break;;
        [Nn]* ) exit 1;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo
