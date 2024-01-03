terraform {
  backend "s3" {
    bucket  = "steven-s3-tfstate-bucket"
    key     = "terraform.tfstate"
    dynamodb_table = "steven-dynamo-table"
    region  = "ap-southeast-1"
    encrypt = true
    # dynamodb_table = "steven-dynamo-table"
  }
}