# Configure the AWS Provider
provider "aws" {
    description = "making region a variable"
  region = var.region-name
}
