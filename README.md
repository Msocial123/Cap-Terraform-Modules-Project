terraform init 
terrafom validate 
terraform plan
terraform apply -var-file="terraform.tfvars"

*********************************************************
To Create a Bucket 

aws s3api create-bucket \
  --bucket murali-simple-clahan \
  --region eu-north-1 \
  --create-bucket-configuration LocationConstraint=eu-north-1
********************************************************************************
To Create a DynamoDB Table 

aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region eu-north-1
******************************************
cd Terraform-Modules
terraform init -migrate-state
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
