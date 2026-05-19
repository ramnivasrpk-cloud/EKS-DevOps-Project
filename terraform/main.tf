terraform {
  backend "s3" {
    bucket = "ramdev18"
    key    = "eks/terraform.tfstate"
    region = "ap-south-1"
  }
}
