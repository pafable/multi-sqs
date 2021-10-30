# MULTI SQS Deployment
This project will create an SQS queue with the name multi-sqs-<REGION>. 
The SQS queues will be created in 6 regions and 2 AWS accounts. 
## Initialize
```
terraform init \
    -backend-config "bucket=<S3_BUCKET>" \
    -backend-config "region=<REGION>" \
    -backend-config "encrypt=true" \
    -backend-config "key=multi-sqs.tfstate"
```

## Workspaces
```
terraform workspace new dev && terraform workspace new prod
```
```
terraform workspace select <ENV>
```

## Plan
```
terraform plan -var=workspace_iam_roles={"dev":"role_arn","prod":"role_arn"} -out plan
```