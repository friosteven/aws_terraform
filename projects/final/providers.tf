provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = "cloudbootcamp"
      ProjectCode = "cross-skilling"
    }
  }
}