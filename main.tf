

# AWS
resource "aws_iam_policy" "example" {
  name = "noncompliantpolicy"

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action   = [
          "*" # Sensitive
        ]
        Effect   = "Allow"
        Resource = [
          aws_s3_bucket.mybucket.arn
        ]
      }
    ]
  })
}

# GCP
resource "google_project_iam_binding" "example" {
  project = "example"
  role    = "roles/owner" # Sensitive

  members = [
    "user:jane@example.com",
  ]
}
