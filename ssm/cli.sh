# deploy kms.yaml first to access alias/tutorial kms' cmk
# CREATE PARAMETERS
aws ssm put-parameter \
    --name "/my-app/dev/db-url" \
    --value "dev.database.stephanetheteacher.com:3306" \
    --type "String" \
    --description "DB Url for the Dev Environment"

aws ssm put-parameter \
    --name "/my-app/dev/db-password" \
    --value "devpassword" \
    --type "SecureString" \
    --key-id $(aws kms describe-key --key-id "alias/tutorial" --query "KeyMetadata.Arn"  --output text) \
    --description "DB Password for Dev"

aws ssm put-parameter \
    --name "/my-app/prod/db-url" \
    --value "prod.stephanetheteacher.com:3306" \
    --type "String" \
    --description "DB Url for the Prod Environment"

aws ssm put-parameter \
    --name "/my-app/prod/db-password" \
    --value "prodpassword" \
    --type "SecureString" \
    --key-id $(aws kms describe-key --key-id "alias/tutorial" --query "KeyMetadata.Arn"  --output text) \
    --description "DB Password for Prod"

# GET PARAMETERS
aws ssm get-parameters --names /my-app/dev/db-url /my-app/dev/db-password
# GET PARAMETERS WITH DECRYPTION
aws ssm get-parameters --names /my-app/dev/db-url /my-app/dev/db-password --with-decryption

# GET PARAMETERS BY PATH
aws ssm get-parameters-by-path --path /my-app/dev/
# GET PARAMETERS BY PATH RECURSIVE
aws ssm get-parameters-by-path --path /my-app/ --recursive
# GET PARAMETERS BY PATH WITH DECRYPTION
aws ssm get-parameters-by-path --path /my-app/ --recursive --with-decryption