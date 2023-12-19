terraform {
  backend "s3" {
    bucket  = "steven-s3-state-bucket"
    key     = "terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
    # dynamodb_table = "steven-dynamo-table"
  }
}