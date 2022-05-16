terraform {
  backend "s3" {
    bucket = "terraform-krishna61"
    key    = "remotestate.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}